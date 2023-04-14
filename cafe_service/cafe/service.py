import datetime
from cafe_service.cafe.repository import AbstractProductRepo, ProductRepository
from django_barcode.fields import BarcodeField

from cafe_service.cafe.serializers import ProducCreateRequestSchema


class CafeService:
    def __init__(self, repo: AbstractProductRepo) -> None:
        # TODO 나중에 의존성 끊기
        self.repository = ProductRepository

    def create(
        self,
        name: str,
        price: int,
        cost: int,
        barcode: BarcodeField,
        expire_date: datetime,
        description: str,
        size: str,
    ) -> dict:
        """
        상품 생성
        view의 scheme에서 params로 입력받습니다.
        Returns:
            dict: 상품 정보
        """
        data = {
            "name": name,
            "price": price,
            "cost": cost,
            "barcode": barcode,
            "exprie_date": expire_date,
            "description": description,
            "size": size,
        }
        params = ProducCreateRequestSchema(data=data)
        params.is_valid(raise_exception=True)

        return self.repository.create(**params.data)

    def update(
        self,
        product_id: int,
        name: str,
        price: int,
        cost: int,
        barcode: BarcodeField,
        expire_date: datetime,
        description: str,
        size: str,
    ) -> dict:
        """
        상품 업데이트
        view의 scheme에서 **params로 입력받습니다.
        Returns:
            dict: 상품 정보
        """
        data = {
            "product_id": product_id,
            "name": name,
            "price": price,
            "cost": cost,
            "barcode": barcode,
            "exprie_date": expire_date,
            "description": description,
            "size": size,
        }
        params = ProducCreateRequestSchema(data=data)
        params.is_valid(raise_exception=True)

        updated = self.repository.update(data=params.data)
        return updated

    def get(self, product_id: int) -> dict:
        """
        Args:
            product_id (int)
        Returns:
            dict: 상품 상세정보
        """
        return_dict = self.repository.get(product_id=product_id)
        return return_dict

    def find(self, search_string: str, pages: int) -> list[dict]:
        """
        검색어를 받아 리스트로 반환합니다.
        Args:
            search_string (str): 검색어(초성 포함)
            pages (int): 페이지 넘버 (1부터 시작)
        Returns:
            list[dict]: 반환되는 리스트 각각의 상품에는 일부 정보만 들어있습니다.
        """

        # TODO 초성검색 구현하기

        pass

    def delete(self, product_id: int) -> str:
        self.repository.delete(product_id=product_id)
        pass