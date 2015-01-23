package com.test;
import java.beans.PropertyDescriptor;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import com.xdylpg.ORM.Shop;
 
public class ReflectionTest {
    public static void main(String args[]) {
        try {
            //通过反射获得类
            Class clazz = Class.forName("com.xdylpg.ORM.Shop");
            String[] bb = {"busaddr","busintr","hotlimit","busAdmin"};
            
            Shop shop = null;
            shop = (Shop)clazz.newInstance();
            for(String tmp : bb)
            {
            	PropertyDescriptor pd = new PropertyDescriptor(tmp, clazz);
            	Method wM = pd.getWriteMethod();
            	 System.out.println("======== "+wM.getName()+" "+wM.getParameterTypes()[0].getName());
            	wM.invoke(shop,prepareValue(wM.getParameterTypes()[0],"123"));
            	 System.out.println(shop.getBusaddr());
            }
            System.out.println("======== ==="+shop.getBusaddr());
            System.out.println(shop==null);
            //实例化类
            Object user = clazz.newInstance();
            //获得类的所有属性
            Field[] fields = clazz.getDeclaredFields();
             
            for(Field f : fields){
                PropertyDescriptor pd = new PropertyDescriptor(f.getName(), clazz);  
                //获得写方法
                Method wM = pd.getWriteMethod();
                //获得读方法  
                Method rM = pd.getReadMethod();
                //获得方法的参数，因为是标准的set方法，所以只取第一个参数
                Class[] classes = wM.getParameterTypes();
                //判断参数不为空，则只有一个
                if(classes != null && classes.length == 1){
                    //判断参数类型
                    if(classes[0].equals(String.class)){
                        //调用set方法，传参
                        wM.invoke(user, "Jack");
                        //调用get方法，获得返回值
                        String str = (String) rM.invoke(user);
                        System.out.println("Name is : " + str);
                    }
                    if(classes[0].equals(int.class)){
                        wM.invoke(user, 2);
                        Integer num = (Integer) rM.invoke(user);
                        System.out.println("Age is : " + num);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

	private static Object prepareValue(Class<?> class1, String string) {
		Constructor[] con = class1.getConstructors();
    	Object result = null;
    	for(int i=0;i<con.length;i++)
    	{
    		try {
				result = con[i].newInstance(string);
			} catch (InstantiationException | IllegalAccessException
					| IllegalArgumentException | InvocationTargetException e) {
				continue;
			}
    	}
    	return result;
	}

}
 
class User {
    private String Name;
    private int age;
 
    public String getName() {
        return Name;
    }
 
    public void setName(String name) {
        Name = name;
    }
 
    public int getAge() {
        return age;
    }
 
    public void setAge(int age) {
        this.age = age;
    }
    
    private static Object prepareObject(Class<?> to,String src)
    {
    	Constructor[] con = to.getConstructors();
    	Object result = null;
    	for(int i=0;i<con.length;i++)
    	{
    		try {
				result = con[i].newInstance(src);
			} catch (InstantiationException | IllegalAccessException
					| IllegalArgumentException | InvocationTargetException e) {
				continue;
			}
    	}
    	return result;
    }
}