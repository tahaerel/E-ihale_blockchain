// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

contract ihale is Ownable {

        struct ihaleBilgi {
            string katagori;
            string marka;
            string model;
            string vites;
            string yakit;
            uint256 yil;
            uint256 km;
            uint256 BaslangicBedeli;
            uint256 ihaleBitisTarihi;
            uint256 zirve;
            address zirveadresi;
        }
  
        mapping(uint256 => ihaleBilgi) ihaleler;
        uint256 ihaleId;
        mapping(address => uint256) bakiyeler;

        event tekliflersiralamasi(uint256 indexed ihaleId ,address teklifVeren,uint teklif);
        event ihalelersiralamasi(uint256 indexed ihaleId);

    function ParaYukle(uint _bakiye) public onlyOwner {
        bakiyeler[msg.sender] = bakiyeler[msg.sender] + _bakiye;
    }
        
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
        uint256 _ihaleId) external onlyOwner {
        ihaleId =_ihaleId;
        ihaleler[ihaleId].katagori = _katagori;
        ihaleler[ihaleId].marka = _marka;
        ihaleler[ihaleId].model = _model;
        ihaleler[ihaleId].vites = _vites;
        ihaleler[ihaleId].yakit = _yakit;
        ihaleler[ihaleId].yil = _yil;
        ihaleler[ihaleId].km = _km;
        ihaleler[_ihaleId].BaslangicBedeli = _BaslangicBedeli;
        ihaleler[_ihaleId].ihaleBitisTarihi = (block.timestamp) + (_ihaleBitisTarihi *1 hours);

        emit ihalelersiralamasi(_ihaleId);
    }

    function ZirveKontrol(uint256 _deger,uint256 _ihaleId) private view returns(bool){
        return _deger>ihaleler[_ihaleId].zirve;
    }

    function TeklifVer(uint256 teklif,uint256 _ihaleId) external BittimiKontrol(_ihaleId) {
        require(bakiyeler[msg.sender] >= teklif,"Bakiyeniz Yetersiz");
        require(ihaleler[_ihaleId].BaslangicBedeli <teklif, "Baslangic Bedelinden Dusuk Deger Girdiniz");
        require(ZirveKontrol(teklif,_ihaleId),"En Yuksek Teklifin Altinda Bir Teklif Verdin");
        ihaleler[_ihaleId].zirve = teklif;
        ihaleler[_ihaleId].zirveadresi = msg.sender;
        emit tekliflersiralamasi(_ihaleId, msg.sender, teklif);
    }

    function getBakiye() public view returns(uint256) {
        return bakiyeler[msg.sender];
    }

    function EnYuksekTeklif(uint256 _ihaleId) external view returns(uint){
        return ihaleler[_ihaleId].zirve;
    }

    function IhaleBitisTarihi(uint256 _ihaleId) external  view BittimiKontrol(_ihaleId) returns(uint256) {
        return ihaleler[_ihaleId].ihaleBitisTarihi;
    }

    function IhaleKazanani(uint256 _ihaleId) external view returns(address){
        require(block.timestamp >= ihaleler[_ihaleId].ihaleBitisTarihi,"Ihale Bitmedigi Icin Kazanan Yok");
        return  ihaleler[_ihaleId].zirveadresi;
    }

    function Ihalelerigetir(uint256 _ihaleId) public view returns(ihaleBilgi memory) {
        return ihaleler[_ihaleId];
    }

    modifier BittimiKontrol(uint256 _ihaleId) {
        require(block.timestamp <= ihaleler[_ihaleId].ihaleBitisTarihi,"Ihale Bitti"); 
        _;
    } 
}