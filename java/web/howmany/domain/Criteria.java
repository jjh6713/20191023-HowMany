package web.howmany.domain;

import lombok.Data;

@Data
public class Criteria {

	private int pageNum; // 페이지 번호
	private int amount; //페이지 안에서 보여질 데이터 수
	
	private String type;
	private String keyword;
	
	public Criteria() {
		this(1,10);
	}
	
	public Criteria(int pageNum,int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	//null 일 경우에는 배열하나 생성해서 리턴 아니면 분할
	public String[] getTypeArr() {
		return type == null ? new String[] {}: type.split("");
	}	
}
