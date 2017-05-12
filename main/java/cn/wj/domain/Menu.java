package cn.wj.domain;

import java.util.List;

public class Menu {
    private Integer menuId;

    private String menuName;//菜单名

    private String menuUrl;//菜单连接地址

    private Integer parentId;//父级菜单  0 表示根节点

    private String menuOrder;//菜单顺序

    private String menuIcon;//菜单图标

    private String menuType;//切换菜单   （待开发功能）
    /**
     * 子结点个数
     */
    private Integer countChildrens;

    private Menu parentMenu;
    private List<Menu> subMenu;
    private boolean hasMenu = false;

    public Integer getCountChildrens() {
        return countChildrens;
    }

    public void setCountChildrens(Integer countChildrens) {
        this.countChildrens = countChildrens;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public Menu getParentMenu() {
        return parentMenu;
    }

    public void setParentMenu(Menu parentMenu) {
        this.parentMenu = parentMenu;
    }

    public List<Menu> getSubMenu() {
        return subMenu;
    }

    public void setSubMenu(List<Menu> subMenu) {
        this.subMenu = subMenu;
    }

    public boolean isHasMenu() {
        return hasMenu;
    }

    public void setHasMenu(boolean hasMenu) {
        this.hasMenu = hasMenu;
    }

    public Integer getMenuId() {
        return menuId;
    }

    public void setMenuId(Integer menuId) {
        this.menuId = menuId;
    }

    public String getMenuName() {
        return menuName;
    }

    public void setMenuName(String menuName) {
        this.menuName = menuName;
    }

    public String getMenuUrl() {
        return menuUrl;
    }

    public void setMenuUrl(String menuUrl) {
        this.menuUrl = menuUrl;
    }

    public Integer getParentId() {
        return parentId;
    }

    public String getMenuOrder() {
        return menuOrder;
    }

    public void setMenuOrder(String menuOrder) {
        this.menuOrder = menuOrder;
    }

    public String getMenuIcon() {
        return menuIcon;
    }

    public void setMenuIcon(String menuIcon) {
        this.menuIcon = menuIcon;
    }

    public String getMenuType() {
        return menuType;
    }

    public void setMenuType(String menuType) {
        this.menuType = menuType;
    }
    public void getParent(Menu parentMenu){
        this.parentMenu = parentMenu;
    }

    @Override
    public String toString() {

      // String MenuName= menuName;
        return "MenuName{" +
                "menuId='" + menuId + '\''
                + ",menuName='" + menuName + '\''
                + ", menuUrl='" + menuUrl + '\''
                + ", menuIcon='" + menuIcon + '\''
                + ", parentId='" + parentId + '\''
                + ", countChildrens='" + countChildrens + '\''
                + ", subMenu='" + subMenu +
                '}';

    }
}
//return "Menu{" +
//        "menuId='" + menuId + '\''
//        + "menuName='" + menuName + '\''
//        + ", menuUrl='" + menuUrl + '\''
//        + ", parentId='" + parentId + '\''
//        + ", menuOrder='" + menuOrder + '\''
//        + ", menuIcon='" + menuIcon + '\''
//        + ", menuType=" + menuType + '\''
//        + ", countChildrens='" + countChildrens + '\''
//        + ", parentMenu='" + parentMenu + '\''
//        + ", subMenu='" + subMenu +
//        '}';