window.addEventListener("message", (event) =>{
    data = event.data
    if (data.type == "none") {
        document.getElementById("container").style.display = "none"
    }else{}
    

       
    if (data.type === "car"){
   
        document.getElementById("container").style.display = "flex"
        document.getElementById("street-output").textContent = data.streetname
        if (data.vector >= 315 || data.vector < 45) {
            document.getElementById("vector-output").textContent = "N"
        }
        else if (data.vector >= 45 || data.vector < 135) {
            document.getElementById("vector-output").textContent = "E"
        } 
        else if (data.vector >= 135 || data.vector < 225) {
            document.getElementById("vector-output").textContent = "S"
        }
        else if (data.vector >= 225 || data.vector < 315) {
            document.getElementById("vector-output").textContent = "W"
        }
        if (data.speed >= 0) {
            document.getElementById("speed").textContent = Math.floor(data.speed)
            if (data.speedtype == "mph"){
                document.getElementById("speedtype").textContent = "MPH"
            }else{
                document.getElementById("speedtype").textContent = "KMH"
            }
        }
        if (data.fuel > -1) {
            document.getElementById("fuel").textContent = Math.floor(data.fuel)
        }
        if (data.gear) {
            document.getElementById("gear").textContent = Math.floor(data.gear)
        }
}
})

