package com.hotel.util;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

import org.springframework.beans.factory.annotation.Autowired;

import com.hotel.inaccount.dao.vo.InAccount;
import com.hotel.inaccount.service.InAccountService;
import com.hotel.registrationinfor.dao.vo.RegistrationInfor;
import com.hotel.registrationinfor.service.RegistrationInforService;

public class SetTimer {
    
    public void showTimer() {
       TimerTask task = new TimerTask() {
          @Override
           public void run() {
        	  InToAccount();
           }
       };

       //设置执行时间
       Calendar calendar =Calendar.getInstance();
       int year = calendar.get(Calendar.YEAR);
       int month = calendar.get(Calendar.MONTH);
       int day =calendar.get(Calendar.DAY_OF_MONTH);//每天
       //定制每天的21:09:00执行，
       calendar.set(year, month, day, 13, 32, 00);
       Date date = calendar.getTime();
       Timer timer = new Timer();
       System.out.println(date);
       
       int period = 2 * 1000;
       //每天的date时刻执行task，每隔2秒重复执行
       //timer.schedule(task, date, period);
       //每天的date时刻执行task, 仅执行一次
       timer.schedule(task, date);
    }

    public static void main(String[] args) {
       SetTimer s = new SetTimer();
       s.showTimer();
    }
    
    /**
     * 每天入账系统
     */
    private void InToAccount(){
    	List<RegistrationInfor> list = new ArrayList<>();
    	RegistrationInforService service = new RegistrationInforService();
    	InAccountService inaccountservice = new InAccountService();
    	//list = service.queryAll();
    	for(RegistrationInfor ri:list){
    		if(ri.getRi_state()==1&&ri.getRi_endtime().compareTo(new Date())>=0){
    			//开始入账
    			InAccount ia = new InAccount();
    			ia.setIa_intime(new Date());
    			ia.setIa_money(ri.getRi_allmoney()/ri.getRi_days());
    			ia.setIa_name("系统");
    			ia.setIa_paytype(ri.getRi_paytype());
    			ia.setIa_source(ri.getRi_source());
    			ia.setIa_keyway(ri.getRi_keyway());	//开放方式（天房，月租房等等）
    			ia.setR(ri.getR());
    			inaccountservice.add(ia);
    		}
    	}
    	inaccountservice.add(new InAccount());
    }
}