
/*work0617******************************************************************************************************************************************* */
// var price1 = 3000;
// var price2 = 6000;
// var price3 = 3000;
// var calc = (price1 + price2 + price3) - 10000; 

// var total = 10000 < price1 + price2 + price3 ? calc + "원 초과" : "돈관리 잘했어요!";

// document.write(total);

//*************************************************************************************** */
// var num4 = prompt("4분기 판매량 입력 : ");
// var num1 = 1200;
// var num2 = 1300;
// var num3 = 1000;
// var avg_num = (num1 + num2 + num3) / 3;

// var output;
// if( num4 >= avg_num ){
//     output = "4분기 판매량이 평균 이상입니다.";    
// }else{
//     output = "4분기 판매량이 평균 미달입니다.";    
// }

// document.write("1, 2, 3분기 평균 판매량은 " + avg_num + "입니다<br />" + output);
//*************************************************************************************** */
// var i = 1;
// while(i <= 9){
//     document.write("5 X " + i + "= " + i*5 + "<br />");
//     i++
// }
//*************************************************************************************** */
var num = 1;
var t = "<table border=1>";
for(var i = 1; i <= 5; i++){
    t += "<tr>";

    for(var k = 1; k <=5 ; k++){
        t += "<td>" + num + "</td>";
        num++;
    }

    t += "</tr>";
}

t += "</table>";
document.write(t);