package com.example.test.model;

import java.util.Date;
public class BoardDTO{
private int idx;
private String title;
private String contents;
private String writer;
private Date regdate;//java.util.Date
private int hit;

public int getIdx(){
	return idx;
}
public void setIdx(int idx){
	this.idx=idx;
}
public String getTitle(){
return title;
}
public void setTitle(String title){
this.title=title;
}
public String getContents(){
return contents;
}
public void setContents(String contents){
this.contents=contents;
}
public String getWriter(){
return writer;
}
public void setWriter(String writer){
this.writer=writer;
}
public Date getRegdate(){
return regdate;
}
public void setRegdate(Date regdate){
this.regdate=regdate;
}
public int getHit(){
return hit;
}
public void setHit(int hit){
this.hit=hit;
}



@Override
public String toString(){
return "BoardDTO [idx=" + idx + ", title=" + title +
",contents="+contents+",writer="+writer
+",regdate="+regdate+",hit="+hit+"]";
}
}