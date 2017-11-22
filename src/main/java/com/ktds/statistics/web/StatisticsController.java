package com.ktds.statistics.web;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ktds.hdfs.ReadAccessLog;
import com.ktds.hdfs.ReadRemoteFile;
import com.ktds.statistics.vo.StatisticsLoginVO;
import com.ktds.statistics.vo.StatisticsVO;

@Controller
public class StatisticsController {

	@RequestMapping("/statistics")
	public ModelAndView viewStatisticsPage() {
		ModelAndView view = new ModelAndView();
		String[] logs = ReadRemoteFile.get("z:\\mwkon", file -> file.getName().startsWith("part-")).split("\n");
		
		List<StatisticsVO> statisticsList = 
			Arrays.asList(logs)
					.stream()
					.filter(row -> {
						boolean isLogData = row.split(",").length == 4;
						boolean isLogData2 = row.startsWith("20");
						return isLogData && isLogData2;
					})
					.filter(row -> row.split(",")[3].trim().matches("[0-9]+"))
					.map(row -> {
						String[] cols = row.split(",");
						//201711170401,/Cafe/board/read/0,GET,1
						StatisticsVO statistics = new StatisticsVO();
						
						String dateTime = cols[0];
//						dateTime = String.format("%s-%s-%s %s:%s", 
//								dateTime.substring(0, 4),
//								dateTime.substring(4, 6),
//								dateTime.substring(6, 8),
//								dateTime.substring(8, 10),
//								dateTime.substring(10, 12)
//								);
						// 2017-11-17 04:01
						statistics.setDateTime(dateTime);
						statistics.setUri(cols[1]);
						statistics.setMethod(cols[2]);
						statistics.setCount( Integer.parseInt(cols[3].trim()) );
						return statistics;
					})
					.collect(Collectors.toList());
		
		Map<String, Map<String, List<StatisticsVO>>> groupData = 
			statisticsList.stream()
						  .collect(
							  Collectors.groupingBy(StatisticsVO::getUri, 
									  Collectors.groupingBy(StatisticsVO::getDateTime)));
		
		List<String> allDate = new ArrayList<>();
		
		List<Map<String, Map<String, Integer>>> chartData = 
			groupData.entrySet()
					 .stream()
					 .map(map -> {
						 //{ /Cafe/board/read/2={2017-11-17 04:56=[com.ktds.statistics.vo.StatisticsVO@22ba2a85]}, 
						 //  /Cafe/board/read/1={2017-11-17 04:56=[com.ktds.statistics.vo.StatisticsVO@77fe8d61], 2017-11-17 04:01=[com.ktds.statistics.vo.StatisticsVO@49b9b7e0]}, 
						 //  /Cafe/board/read/3={2017-11-17 04:56=[com.ktds.statistics.vo.StatisticsVO@406a8585]}, 
						 //  /Cafe/board/read/0={2017-11-17 04:56=[com.ktds.statistics.vo.StatisticsVO@33f7710f], 2017-11-17 04:01=[com.ktds.statistics.vo.StatisticsVO@30e17795]}, 
						 //  /Cafe/board/write={2017-11-17 04:55=[com.ktds.statistics.vo.StatisticsVO@34e3c0de], 2017-11-17 04:56=[com.ktds.statistics.vo.StatisticsVO@20312d6a], 2017-11-17 04:01=[com.ktds.statistics.vo.StatisticsVO@28464f6a]}, 
						 //  /Cafe/board/viewAll={2017-11-17 04:55=[com.ktds.statistics.vo.StatisticsVO@1320d828], 2017-11-17 04:56=[com.ktds.statistics.vo.StatisticsVO@39ef1fa2], 2017-11-17 04:01=[com.ktds.statistics.vo.StatisticsVO@109c2f88]}, 
						 //  /Cafe/board/dowrite={2017-11-17 04:55=[com.ktds.statistics.vo.StatisticsVO@a3b1fee], 2017-11-17 04:56=[com.ktds.statistics.vo.StatisticsVO@1f4f6719], 2017-11-17 04:01=[com.ktds.statistics.vo.StatisticsVO@5e9c695d]}}
						 String url = map.getKey();
						 
						 Map<String, Integer> dateCount = new HashMap<>();
						 
						 Iterator<String> keys = map.getValue().keySet().iterator();
						 while(keys.hasNext()) {
							 String date = keys.next();
							 if( !allDate.contains(date) ) {
								 allDate.add(date);
							 }
							 List<StatisticsVO> statistics = map.getValue().get(date);
							 for ( StatisticsVO st : statistics ) {
								 dateCount.put(date, st.getCount());
							 }
						 }
						 
						 // { /Cafe/board/read/2={2017-11-17 04:56=2}, 
						 //  /Cafe/board/read/1={2017-11-17 04:56=2, 2017-11-17 04:01=1}, 
						 //  /Cafe/board/read/3={2017-11-17 04:56=2}, 
						 //  /Cafe/board/read/0={2017-11-17 04:56=2, 2017-11-17 04:01=1}, 
						 //  /Cafe/board/write={2017-11-17 04:55=3, 2017-11-17 04:56=1, 2017-11-17 04:01=2}, 
						 //  /Cafe/board/viewAll={2017-11-17 04:55=5, 2017-11-17 04:56=10, 2017-11-17 04:01=4}, 
						 //  /Cafe/board/dowrite={2017-11-17 04:55=3, 2017-11-17 04:56=1, 2017-11-17 04:01=2}}
						 Map<String, Map<String, Integer>> urlDateCount = new HashMap<>();
						 urlDateCount.put(url, dateCount);
						 return urlDateCount;
					 })
					 .collect(Collectors.toList());
		
		String data = "";
		for ( int i = 0; i < chartData.size(); i++) {
			Map<String, Map<String, Integer>> map = chartData.get(i);
			
			Iterator<String> keys = map.keySet().iterator();
			while ( keys.hasNext() ) {
				String url = keys.next();
				Map<String, Integer> dateCount = map.get(url);
				for(String date : allDate) {
					if ( !dateCount.containsKey(date) ) {
						dateCount.put(date, 0);
					}
				}
				
				String dateCountNew = 
					dateCount.entrySet()
							 .stream()
							 .sorted((ent1, ent2) -> {
								 return (int) (Long.parseLong(ent1.getKey()) - Long.parseLong(ent2.getKey()));
							 })
							.map(ent -> {
								System.out.println(ent.getKey());
								return ent.getValue() + "";
							})
							.collect(Collectors.joining(","));
				
				data += "['" + url + "'," + dateCountNew + "],";
			}
		}
		
		String category = 
			allDate.stream()
				   .sorted((date1, date2) -> (int)(Long.parseLong(date1) - Long.parseLong(date2)))
				   .map(date -> {
					   return "'" + String.format("%s-%s-%s %s:%s", 
								date.substring(0, 4),
								date.substring(4, 6),
								date.substring(6, 8),
								date.substring(8, 10),
								date.substring(10, 12)) + "'";
				   })
				   .collect(Collectors.joining(","));
		
		view.addObject("data", data.substring(0, data.length() - 1));
		view.addObject("category", "[" + category + "]");
		view.addObject("statisticsList", statisticsList);
		view.setViewName("statistics/statistics");
		return view;
	}
	
	@RequestMapping("/statisticsLogin")
	public ModelAndView viewStatisticsLoginPage() {
		ModelAndView view = new ModelAndView();
		String[] logs = ReadRemoteFile.get("z:\\mwkon", file -> file.getName().startsWith("part-")).split("\n");
		
		List<StatisticsLoginVO> statisticsList = 
			Arrays.asList(logs)
					.stream()
					.filter(row -> {
						boolean isLogData = row.split(",").length == 3;
						boolean isLogData2 = row.startsWith("20");
						return isLogData && isLogData2;
					})
					.map(row -> {
						String[] cols = row.split(",");
						//201711170401,/Cafe/board/read/0,GET,1
						StatisticsLoginVO statisticsLogin = new StatisticsLoginVO();
					
						statisticsLogin.setLoginTime(cols[0].trim());
						statisticsLogin.setLoginId(cols[1]);
						statisticsLogin.setCount( Integer.parseInt(cols[2].trim()) );
						return statisticsLogin;
					})
					.collect(Collectors.toList());
		
		Map<String, Map<String, List<StatisticsLoginVO>>> groupData = 
			statisticsList.stream()
						  .collect(
							  Collectors.groupingBy(StatisticsLoginVO::getLoginId, 
									  Collectors.groupingBy(StatisticsLoginVO::getLoginTime)));
		
		List<String> allDate = new ArrayList<>();
		
		List<Map<String, Map<String, Integer>>> chartData = 
			groupData.entrySet()
					 .stream()
					 .map(map -> {
						 //{ /Cafe/board/read/2={2017-11-17 04:56=[com.ktds.statistics.vo.StatisticsVO@22ba2a85]}, 
						 //  /Cafe/board/read/1={2017-11-17 04:56=[com.ktds.statistics.vo.StatisticsVO@77fe8d61], 2017-11-17 04:01=[com.ktds.statistics.vo.StatisticsVO@49b9b7e0]}, 
						 //  /Cafe/board/read/3={2017-11-17 04:56=[com.ktds.statistics.vo.StatisticsVO@406a8585]}, 
						 //  /Cafe/board/read/0={2017-11-17 04:56=[com.ktds.statistics.vo.StatisticsVO@33f7710f], 2017-11-17 04:01=[com.ktds.statistics.vo.StatisticsVO@30e17795]}, 
						 //  /Cafe/board/write={2017-11-17 04:55=[com.ktds.statistics.vo.StatisticsVO@34e3c0de], 2017-11-17 04:56=[com.ktds.statistics.vo.StatisticsVO@20312d6a], 2017-11-17 04:01=[com.ktds.statistics.vo.StatisticsVO@28464f6a]}, 
						 //  /Cafe/board/viewAll={2017-11-17 04:55=[com.ktds.statistics.vo.StatisticsVO@1320d828], 2017-11-17 04:56=[com.ktds.statistics.vo.StatisticsVO@39ef1fa2], 2017-11-17 04:01=[com.ktds.statistics.vo.StatisticsVO@109c2f88]}, 
						 //  /Cafe/board/dowrite={2017-11-17 04:55=[com.ktds.statistics.vo.StatisticsVO@a3b1fee], 2017-11-17 04:56=[com.ktds.statistics.vo.StatisticsVO@1f4f6719], 2017-11-17 04:01=[com.ktds.statistics.vo.StatisticsVO@5e9c695d]}}
						 String loginId = map.getKey();
						 
						 Map<String, Integer> dateCount = new HashMap<>();
						 
						 Iterator<String> keys = map.getValue().keySet().iterator();
						 while(keys.hasNext()) {
							 String date = keys.next();
							 if( !allDate.contains(date) ) {
								 allDate.add(date);
							 }
							 List<StatisticsLoginVO> statisticsLogin = map.getValue().get(date);
							 for ( StatisticsLoginVO st : statisticsLogin ) {
								 dateCount.put(date, st.getCount());
							 }
						 }
						 
						 // { /Cafe/board/read/2={2017-11-17 04:56=2}, 
						 //  /Cafe/board/read/1={2017-11-17 04:56=2, 2017-11-17 04:01=1}, 
						 //  /Cafe/board/read/3={2017-11-17 04:56=2}, 
						 //  /Cafe/board/read/0={2017-11-17 04:56=2, 2017-11-17 04:01=1}, 
						 //  /Cafe/board/write={2017-11-17 04:55=3, 2017-11-17 04:56=1, 2017-11-17 04:01=2}, 
						 //  /Cafe/board/viewAll={2017-11-17 04:55=5, 2017-11-17 04:56=10, 2017-11-17 04:01=4}, 
						 //  /Cafe/board/dowrite={2017-11-17 04:55=3, 2017-11-17 04:56=1, 2017-11-17 04:01=2}}
						 Map<String, Map<String, Integer>> urlDateCount = new HashMap<>();
						 urlDateCount.put(loginId, dateCount);
						 return urlDateCount;
					 })
					 .collect(Collectors.toList());
		
		String data = "";
		for ( int i = 0; i < chartData.size(); i++) {
			Map<String, Map<String, Integer>> map = chartData.get(i);
			
			Iterator<String> keys = map.keySet().iterator();
			while ( keys.hasNext() ) {
				String url = keys.next();
				Map<String, Integer> dateCount = map.get(url);
				for(String date : allDate) {
					if ( !dateCount.containsKey(date) ) {
						dateCount.put(date, 0);
					}
				}
				
				String dateCountNew = 
					dateCount.entrySet()
							 .stream()
							 .sorted((ent1, ent2) -> {
								 return (int) (Long.parseLong(ent1.getKey()) - Long.parseLong(ent2.getKey()));
							 })
							.map(ent -> {
								System.out.println(ent.getKey());
								return ent.getValue() + "";
							})
							.collect(Collectors.joining(","));
				
				data += "['" + url + "'," + dateCountNew + "],";
			}
		}
		
		String category = 
			allDate.stream()
				   .sorted((date1, date2) -> (int)(Long.parseLong(date1) - Long.parseLong(date2)))
				   .map(date -> {
					   return "'" + String.format("%s-%s-%s %s:%s", 
								date.substring(0, 4),
								date.substring(4, 6),
								date.substring(6, 8),
								date.substring(8, 10),
								date.substring(10, 12)) + "'";
				   })
				   .collect(Collectors.joining(","));
		
		view.addObject("data", data.substring(0, data.length() - 1));
		view.addObject("category", "[" + category + "]");
		view.addObject("statisticsList", statisticsList);
		view.setViewName("statistics/statisticsLogin");
		return view;
	}
}
