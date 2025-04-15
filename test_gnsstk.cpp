#include <iostream>
#include "gnsstk/GPSWeekSecond.hpp"

int main() {
    // Crear un objeto GPSWeekSecond
    gnsstk::GPSWeekSecond gpsTime(2245, 345600.0);  // Semana 2245, segundo 345600

    std::cout << "Semana GPS: " << gpsTime.week << std::endl;
    std::cout << "Segundos de la semana: " << gpsTime.sow << std::endl;

    return 0;
}
