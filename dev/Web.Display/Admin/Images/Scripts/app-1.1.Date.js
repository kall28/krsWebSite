function GetDate(year, month, day) {
    var date = new Date();
    date.setFullYear(year, month - 1, day);
    return date
}

function DateDiffInDays(date1, date2) {


}

function GetAge(birthYear, birthMonth, birthDay) {
    var today = new Date();
    var age = 0;
    var birthDate = GetDate(birthYear, birthMonth, birthDay);    
    age = Math.floor((today.getTime() - birthDate.getTime()) / (365.25 * 24 * 60 * 60 * 1000));    
    return age;
}

function IsEligible(birthYear, birthMonth, birthDay, ageLimit) {
    if (GetAge(birthYear, birthMonth, birthDay) >= ageLimit) {
        return true;
    }
    return false;
}

