<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script type="text/javascript">
    function pageJS(page){
        try{
            if(isNaN(page) || page <1 || page > ${page.pages} || parseInt(page) != page){
                alert("Page Number Error.");
            }else if(page != ${page.page}){
                alert("选择页数"+page);
                document.getElementById('pageForm').elements['page'].value = page;
                document.getElementById('pageForm').submit();
            }
        }catch(e){
            alert("Page Form Error.");
        }
    }
</script>
<lable>共${page.count}条/${page.pages}页</lable>
<input type = "button" value = "首页" onclick = "pageJS(1);" <c:if test = '${page.page == 1 } '>disabled</c:if>/>
<input type = "button" value = "上一页" onclick = "pageJS(${page.page} - 1);" <c:if test = '${page.page == 1 } '>disabled</c:if>/>
<input type = "button" value = "下一页" onclick = "pageJS(${page.page} + 1);" <c:if test = '${page.page == page.pages } '>disabled</c:if>/>
<input type = "button" value = "末页" onclick = "pageJS(${page.pages});" <c:if test = '${page.page == page.pages } '>disabled</c:if>/>
<lable>第<input type = "number" id = "page" name = "page" min = "1" max = "${page.pages }" step = "1" value = "${page.page }" onclick = "javacript:pageJS(this.value)" style="width:30px;">页</lable>