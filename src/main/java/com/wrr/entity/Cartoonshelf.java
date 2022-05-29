package com.wrr.entity;
import org.springframework.stereotype.Component;

@Component
//@Data
public class Cartoonshelf {
    private int cartoonId;
    private String cartoonName;   //书名
    private String cartoonType;   //书籍类型(小说或者漫画)
    private String cartoonCover;  //书籍封面
    private String cartoonAuthor; //书籍作者
    private String readName; //书籍作者

    public Cartoonshelf() {
    }

    public Cartoonshelf(String cartoonName, String cartoonType, String cartoonCover, String cartoonAuthor, String readName) {
        this.cartoonName = cartoonName;
        this.cartoonType = cartoonType;
        this.cartoonCover = cartoonCover;
        this.cartoonAuthor = cartoonAuthor;
        this.readName = readName;
    }

    public int getCartoonId() {
        return cartoonId;
    }

    public void setCartoonId(int cartoonId) {
        this.cartoonId = cartoonId;
    }

    public String getCartoonName() {
        return cartoonName;
    }

    public void setCartoonName(String cartoonName) {
        this.cartoonName = cartoonName;
    }

    public String getCartoonType() {
        return cartoonType;
    }

    public void setCartoonType(String cartoonType) {
        this.cartoonType = cartoonType;
    }

    public String getCartoonCover() {
        return cartoonCover;
    }

    public void setCartoonCover(String cartoonCover) {
        this.cartoonCover = cartoonCover;
    }

    public String getCartoonAuthor() {
        return cartoonAuthor;
    }

    public void setCartoonAuthor(String cartoonAuthor) {
        this.cartoonAuthor = cartoonAuthor;
    }

    public String getReadName() {
        return readName;
    }

    public void setReadName(String readName) {
        this.readName = readName;
    }

    @Override
    public String toString() {
        return "Cartoonshelf{" +
                "cartoonkId=" +
                ", cartoonName='" + cartoonName + '\'' +
                ", cartoonType='" + cartoonType + '\'' +
                ", cartoonCover='" + cartoonCover + '\'' +
                ", cartoonAuthor='" + cartoonAuthor + '\'' +
                ", readName='" + readName + '\'' +
                '}';
    }

}
