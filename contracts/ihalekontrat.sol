// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/access/Ownable.sol";

contract ihale is Ownable {

       
        struct Ihalebilgi {
            string katagori;
            string marka;
            string model;
            string vites;
            string yakit;
            uint256 yil;
            uint256 km;
            uint256  BaslangicBedeli;
            uint256 ihaleBitisTarihi;
            uint256 zirve;
            address zirveadresis;
            mapping(address => uint256) teklifVeren;
        }
            mapping(uint256 => Ihalebilgi) ihaleler;
            uint256 ihaleId;
            mapping(address => uint256) bakiyeler;

    function ihaleEkle(
        string memory _katagori,
        string memory _marka,
        string memory _model,
        string memory _vites,
        string memory _yakit,
        uint256 _yil,
        uint256 _km,
        uint256  _BaslangicBedeli,
        uint256  _ihaleBitisTarihi,
        uint256 _ihaleId) public onlyOwner {
        ihaleId =_ihaleId;
        ihaleler[ihaleId].katagori = _katagori;
        ihaleler[ihaleId].marka = _marka;
        ihaleler[ihaleId].model = _model;
        ihaleler[ihaleId].vites = _vites;
        ihaleler[ihaleId].yakit = _yakit;
        ihaleler[ihaleId].yil = _yil;
        ihaleler[ihaleId].km = _km;
        ihaleler[ihaleId].BaslangicBedeli = _BaslangicBedeli;
        ihaleler[ihaleId].ihaleBitisTarihi = (block.timestamp) + (_ihaleBitisTarihi *1 minutes);
        }


    





    
}