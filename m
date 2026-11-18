Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794991088;
	b=axkYLK9vSt9v7vQEx9UvLtT5KzO8QHMdpOa5rITgnyFf/b9vhRj8K7afJNa9VzydPTMf
	 +DEgbumaEUoYmv3sMM3QuD3gtz67k+dzimoQPqJPMnPDpdlcvfPC00rBvoX5mQ8nG9yZW
	 /F6scP2KMLXhvJUtM5iFKYik26l0NG0ySzDLml9Jo8w7aigzIuEk2e+nDdPWAYp6fIHS+
	 EKR2dmoExgGkyBnEUlTSJB+py1Rj0juKWCa+j/97xI7vZNFobDdHkWvqi0envstsntrTU
	 Sw/8TeAT81NPKsV2BZybhY7+XQalJjq3veFQzbX2/zD8mq/oCYKPL9pwmXTHpxbL5sA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794991088;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=CGnq8aX/ZsFRS1LtOwSHFguyRe636ju53+kiTGVTC/o=;
	b=ztfcPNG7omaYeGCa8tQqeDBbgrHMs2jbEpmOCfRQ7HaTJXWKV8nsVxKAwtzVyC06Sq8m
	 AetSdWid/yuLK/WEQF2k3OaUwoGYU4aSDU715Bwyvy8Cf4YPBOInaLumDiiL1gZsSelj+
	 orqSR96AukJCp79gE4QzaiRrWvn0ksS/CwC37NsjavSFkI7GlK0YnxSDRBhrrXldDocU9
	 WCe3fyiYF2zjDsTHugR5DUvEUPfuFfvOIRxi9fDetpvlwsrIMKlP6+Hiq3HP3ZE6GARzg
	 K4A8CtFAEYRojE48prGdXJuMP8IbNhmCnJ/3S9Z62eBxLo8+TPL/Ns03aPqjD7vkWgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MNk7ajDG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9E7606A31C
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 08:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MNk7ajDG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AE301F000C4;
	Wed, 18 Nov 2026 08:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794991087;
	bh=CGnq8aX/ZsFRS1LtOwSHFguyRe636ju53+kiTGVTC/o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MNk7ajDGmEMw0M3C+OROjPSd9TBx4xx71/TIP7fjy7KoiMAw8zki1JUI8qDhKv7lp
	 PQ0J5Sy0aC46U4Tp9XTRYR7D0m9GzkHcn9Z1R/u5CgCrmGGntyLmZaT6cX6GwhKbBO
	 EXNZWhaqPBjzQIfSWfbzir0ZlSES0rbhzhFeCD46CDXxCJKofcCzzLBkBZxPLAfKR5
	 6sPTHJhDmUuQ440ugftayFalfEjUVippM50tb6Ktv/il8CuBLm9Tv0QacW2bH1Ok7y
	 VPhvcSXhsEZXhQMb7XJRDPJ+RSSPMl1UJ9k+CR6a28ESm4WkO8SDZxN/n3644Kewq9
	 J6C+mtrMwFjcg==
Date: Wed, 18 Nov 2026 09:38:05 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Felix Fietkau <nbd@nbd.name>
Cc: linux-wireless@vger.kernel.org
Subject: Re: [PATCH mt76-next 07/19] wifi: mt76: mt7996: stop WED before the
 DMA reset of a full reset
Message-ID: <av1j7Xh9lQBNKorF@lore-qca>
References: <20261117180134.2940930-1-nbd@nbd.name>
 <20261117180134.2940930-7-nbd@nbd.name>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9M1xvDU882pZCzjo"
Content-Disposition: inline
In-Reply-To: <20261117180134.2940930-7-nbd@nbd.name>

--9M1xvDU882pZCzjo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Unlike the L1 SER path, mt7996_mac_restart() resets the WFSYS while the
> attached WEDs still access it over PCIe. Their reads during the reset
> get no completion, and MT7988 reports uncorrectable PCIe completion
> timeouts on both root ports.
>=20
> Stop both WEDs at the start of the restart, and disable the WED
> interrupt agent and wait for it to go idle before the WFSYS reset. The
> other agents stay enabled, since TX through WED stops after the restart
> otherwise.
>=20
> Fixes: 83eafc9251d6 ("wifi: mt76: mt7996: add wed tx support")
> Signed-off-by: Felix Fietkau <nbd@nbd.name>

Reviewed-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
>  .../net/wireless/mediatek/mt76/mt7996/dma.c   | 25 ++++++++++++++++++-
>  .../net/wireless/mediatek/mt76/mt7996/mac.c   | 19 +++++++++-----
>  .../net/wireless/mediatek/mt76/mt7996/regs.h  |  5 ++++
>  3 files changed, 42 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/dma.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7996/dma.c
> index 3d9353811a02..4450d35e9439 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7996/dma.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7996/dma.c
> @@ -3,6 +3,7 @@
>   * Copyright (C) 2022 MediaTek Inc.
>   */
> =20
> +#include <linux/iopoll.h>
>  #include "mt7996.h"
>  #include "../dma.h"
>  #include "mac.h"
> @@ -957,6 +958,25 @@ int mt7996_dma_init(struct mt7996_dev *dev)
>  	return 0;
>  }
> =20
> +static void
> +mt7996_wed_int_agent_disable(struct mt7996_dev *dev,
> +			     struct mtk_wed_device *wed)
> +{
> +	u32 val;
> +
> +	if (!mtk_wed_device_active(wed))
> +		return;
> +
> +	val =3D mtk_wed_device_reg_read(wed, MT_WED_CTRL);
> +	mtk_wed_device_reg_write(wed, MT_WED_CTRL,
> +				 val & ~MT_WED_CTRL_WPDMA_INT_AGENT_EN);
> +
> +	if (read_poll_timeout(mtk_wed_device_reg_read, val,
> +			      !(val & MT_WED_CTRL_WPDMA_INT_AGENT_BUSY),
> +			      100, 20000, false, wed, MT_WED_CTRL))
> +		dev_warn(dev->mt76.dev, "WED interrupt agent still busy\n");
> +}
> +
>  void mt7996_dma_reset(struct mt7996_dev *dev, bool force)
>  {
>  	struct mt76_phy *phy2 =3D dev->mt76.phys[MT_BAND1];
> @@ -996,8 +1016,11 @@ void mt7996_dma_reset(struct mt7996_dev *dev, bool =
force)
>  		mt7996_rro_msdu_page_map_free(dev);
> =20
>  	/* reset wfsys */
> -	if (force)
> +	if (force) {
> +		mt7996_wed_int_agent_disable(dev, &dev->mt76.mmio.wed_hif2);
> +		mt7996_wed_int_agent_disable(dev, &dev->mt76.mmio.wed);
>  		mt7996_wfsys_reset(dev);
> +	}
> =20
>  	if (dev->hif2 && mtk_wed_device_active(&dev->mt76.mmio.wed_hif2))
>  		mtk_wed_device_dma_reset(&dev->mt76.mmio.wed_hif2);
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7996/mac.c
> index 03670293a78f..2e1d98bf823a 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
> @@ -2291,6 +2291,16 @@ void mt7996_tx_token_put(struct mt7996_dev *dev)
>  	}
>  }
> =20
> +static void
> +mt7996_wed_stop(struct mt7996_dev *dev)
> +{
> +	if (mtk_wed_device_active(&dev->mt76.mmio.wed_hif2))
> +		mtk_wed_device_stop(&dev->mt76.mmio.wed_hif2);
> +
> +	if (mtk_wed_device_active(&dev->mt76.mmio.wed))
> +		mtk_wed_device_stop(&dev->mt76.mmio.wed);
> +}
> +
>  static int
>  mt7996_mac_restart(struct mt7996_dev *dev)
>  {
> @@ -2298,6 +2308,8 @@ mt7996_mac_restart(struct mt7996_dev *dev)
>  	struct mt7996_phy *phy;
>  	int i, ret;
> =20
> +	mt7996_wed_stop(dev);
> +
>  	if (dev->hif2) {
>  		mt76_wr(dev, MT_INT1_MASK_CSR, 0x0);
>  		mt76_wr(dev, MT_INT1_SOURCE_CSR, ~0);
> @@ -2573,12 +2585,7 @@ void mt7996_mac_reset_work(struct work_struct *wor=
k)
>  	dev_info(dev->mt76.dev,"\n%s L1 SER recovery start.",
>  		 wiphy_name(hw->wiphy));
> =20
> -	if (mtk_wed_device_active(&dev->mt76.mmio.wed_hif2))
> -		mtk_wed_device_stop(&dev->mt76.mmio.wed_hif2);
> -
> -	if (mtk_wed_device_active(&dev->mt76.mmio.wed))
> -		mtk_wed_device_stop(&dev->mt76.mmio.wed);
> -
> +	mt7996_wed_stop(dev);
>  	mt7996_npu_hw_stop(dev);
>  	ieee80211_stop_queues(mt76_hw(dev));
> =20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/regs.h b/drivers/n=
et/wireless/mediatek/mt76/mt7996/regs.h
> index 6df6e4c3d45d..e82a281a773a 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7996/regs.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt7996/regs.h
> @@ -782,6 +782,11 @@ enum offs_rev {
>  #define MT_WF_SUBSYS_RST_BYPASS_WFDMA2_SLP_PROT	BIT(16)
>  #define MT_WF_SUBSYS_RST_WHOLE_PATH_RST_REVERT_CYCLE	GENMASK(15, 8)
> =20
> +/* WED registers, offsets for mtk_wed_device_reg_read() */
> +#define MT_WED_CTRL				0x00c
> +#define MT_WED_CTRL_WPDMA_INT_AGENT_EN		BIT(0)
> +#define MT_WED_CTRL_WPDMA_INT_AGENT_BUSY	BIT(1)
> +
>  /* PCIE MAC */
>  #define MT_PCIE_MAC_BASE			0x74030000
>  #define MT_PCIE_MAC(ofs)			(MT_PCIE_MAC_BASE + (ofs))
> --=20
> 2.47.3
>=20
>=20

--9M1xvDU882pZCzjo
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCav1j7QAKCRA6cBh0uS2t
rJhBAQDx844leyo0sYwhxjNzKnGu8x8pQY/mrjTaHH4zCY1LLQEA6DUsYnKKPGv0
yIpUCfrNk/45aGe5sJUxIp67MTG/Iwg=
=xqp4
-----END PGP SIGNATURE-----

--9M1xvDU882pZCzjo--
