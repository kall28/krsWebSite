$(function Graph(FistMon, SecMon, ThrdMonth) {
    var FistMon = FistMon.split('|');
    var SecMon = SecMon.split('|');
    var ThrdMonth = ThrdMonth.split('|');
    //for (var i = 0; i < GraphList.rows.Count() ; i++)
    //{
    //    switch(type)
    //    {
    //        case "chart":
    //            break;
    //        case "chart1":
    //            break;
    //        case "chart2":
    //            break;
    //    }
    //}
    

    Morris.Bar({
        element: 'morris-bar-chart',
        data: [{
            y: FistMon,
            a: 1,
            b: 0,
            c: 1
        }, {
            y: 'December',
            a: 75,
            b: 65,
            c: 80
        }, {
            y: 'January',
            a: 50,
            b: 40,
            c: 80
            }, 
            //{
        //    y: '2015',
        //    a: 75,
        //    b: 65,
        //    c: 30
        //}, {
        //    y: '2016',
        //    a: 10,
        //    b: 9,
        //    c: 8
        //}
        ],
        xkey: 'y',
        ykeys: ['a', 'b', 'c'],
        labels: ['RFPs', 'Auctions', 'POs'],
        hideHover: 'auto',
        resize: true
    });

});
