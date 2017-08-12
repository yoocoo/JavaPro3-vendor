package cn.wj.service.serviceImpl;

import cn.wj.dao.GoodsInfoDao;
import cn.wj.domain.GoodsInfo;
import cn.wj.exception.OtherThingsException;
import cn.wj.service.GoodsInfoService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 说明： 售货机实时数据
 * 作者： 王娇
 * 时间： 2017 年 08月 07 日
 */
@Service("goodInfoService")
public class GoodsInfoServiceImpl implements GoodsInfoService {
	@Autowired
	private GoodsInfoDao goodsInfoDao;//加入事物的管理

	/**
	 * 功能说明： 1.1.1  运营商管理员 更新商品信息表
	 * @param goodsInfo
	 * @throws Exception
	 */
	public void updateGoodsInfo(GoodsInfo goodsInfo) throws OtherThingsException {
		int result1 = 0;//受影响的行数默认为零
		try {
			result1 = goodsInfoDao.updateGoodsInfo(goodsInfo);
		} catch (Exception e) {
			System.out.println(" 运营商更新商品信息表 service失败");
			//其他用户添加失败异常
			throw new OtherThingsException(e);
		}
		if (result1 > 0) {
			System.out.println(" 运营商更新商品信息表 service更新用户信息成功！");
		}
	}

	/**
	 * 1.1.2 运营商管理员 更新 商品图像信息
	 * @param goodsImg
	 * @param goodsId
	 * @throws Exception
	 */
	public void updateGoodsImg(@Param("goodsImg") String goodsImg, @Param("goodsId") int goodsId) throws Exception {
		int result1 = 0;//受影响的行数默认为零
		try {
			result1 = goodsInfoDao.updateGoodsImg(goodsImg,goodsId);
		} catch (Exception e) {
			System.out.println(" 运营商更新商品图像 service失败");
			//其他用户添加失败异常
			throw new OtherThingsException(e);
		}
		if (result1 > 0) {
			System.out.println(" 运营商更新商品图像 service更新用户信息成功！");
		}
	}

	/**
	 * 功能说明： 2.1.1  运营商管理员 新增商品记录
	 * @param goodsInfo
	 * @throws Exception
	 */
	public void yunAddGoods(GoodsInfo goodsInfo)throws OtherThingsException {
		int result1 = 0;//受影响的行数默认为零
		try {
			result1 = goodsInfoDao.yunAddGoods(goodsInfo);
		} catch (Exception e) {
			System.out.println(" 运营商管理员 新增商品信息表 service失败");
			//其他用户添加失败异常
			throw new OtherThingsException(e);
		}
		if (result1 > 0) {
			System.out.println(" 运营商管理员 新增商品信息表 service更新用户信息成功！");
		}
	}

	/**
	 * 功能说明： 3.1.1  运营商管理员 删除商品记录
	 * @param goodsInfo
	 * @throws Exception
	 */
	public void deleteGoodsInfo(GoodsInfo goodsInfo)throws OtherThingsException {
		int result1 = 0;//受影响的行数默认为零
		try {
			result1 = goodsInfoDao.deleteGoodsInfo(goodsInfo);
		} catch (Exception e) {
			System.out.println(" 运营商管理员 删除商品信息表 service失败");
			//其他用户添加失败异常
			throw new OtherThingsException(e);
		}
		if (result1 > 0) {
			System.out.println(" 运营商管理员 删除商品信息表 service更新用户信息成功！");
		}
	}

	//==================自动生成===========================
	@Override
	public void add(GoodsInfo goodsInfo) throws Exception {

	}

	@Override
	public void update(GoodsInfo goodsInfo) throws Exception {

	}

	@Override
	public List<GoodsInfo> findAll(int pageNum, int pageSize) {
		return null;
	}


}
