package com.wrr.entity;
import lombok.Data;
import org.springframework.stereotype.Component;

@Component
//@Data
public class Novelshelf {
    private int bookId;
    private String bookName;   //书名
    private String bookType;   //书籍类型(小说或者漫画)
    private String bookCover;  //书籍封面
    private String bookAuthor; //书籍作者
    private String readName; //书籍作者

    public Novelshelf() {
    }


    public Novelshelf(String bookName, String bookType, String bookCover, String bookAuthor, String readName) {

        this.bookName = bookName;
        this.bookType = bookType;
        this.bookCover = bookCover;
        this.bookAuthor = bookAuthor;
        this.readName = readName;
    }

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public String getBookType() {
        return bookType;
    }

    public void setBookType(String bookType) {
        this.bookType = bookType;
    }

    public String getBookCover() {
        return bookCover;
    }

    public void setBookCover(String bookCover) {
        this.bookCover = bookCover;
    }

    public String getBookAuthor() {
        return bookAuthor;
    }

    public void setBookAuthor(String bookAuthor) {
        this.bookAuthor = bookAuthor;
    }

    public String getReadName() {
        return readName;
    }

    public void setReadName(String readName) {
        this.readName = readName;
    }

    @Override
    public String toString() {
        return "Novelshelf{" +
                "bookId=" + bookId +
                ", bookName='" + bookName + '\'' +
                ", bookType='" + bookType + '\'' +
                ", bookCover='" + bookCover + '\'' +
                ", bookAuthor='" + bookAuthor + '\'' +
                ", readName='" + readName + '\'' +
                '}';
    }
}
