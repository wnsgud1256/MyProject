package Board;

import java.sql.Date;

public class BoardDTO {

	private String boardWriter;
	private int boardCount;
	private String boardContent;
	private String boardDate;
	private String boardTitle;
	private String boardLmd;
	
	public String getBoardLmd() {
		return boardLmd;
	}
	public void setBoardLmd(String boardLmd) {
		this.boardLmd = boardLmd;
	}
	private int boardNumber;
	
	public int getBoardNumber() {
		return boardNumber;
	}
	public void setBoardNumber(int boardNumber) {
		this.boardNumber = boardNumber;
	}
	public String getBoardWriter() {
		return boardWriter;
	}
	public void setBoardWriter(String boardWriter) {
		this.boardWriter = boardWriter;
	}
	public int getBoardCount() {
		return boardCount;
	}
	public void setBoardCount(int boardCount) {
		this.boardCount = boardCount;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public String getBoardDate() {
		return boardDate;
	}
	public void setBoardDate(String boardDate) {
		this.boardDate = boardDate;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	
	
}
