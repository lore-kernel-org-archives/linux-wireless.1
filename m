Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795760610;
	b=KSPif2InKS2eZzRgB2kIDEPQfa0IxSXMeqxzKqrQByIj5yGKUfKvMJ+agnWybuF3YZ64
	 9m3/zjcLH+2B327Tb5IJuuSAj2apcj9wN6tpAMyWGoTlVISslBusjktSeUheYzlh3cJkI
	 HkqfT5wjza2KfAh6rGXLTEKRiC9z92m1zlnsB7R1CiSiVYZFBfJxoayq/u+RQXAbJeYmD
	 N4cQ7DFbtYUibEFcvC3Cms4KDl/eRnnwgaXRWWN+BcFA/m10tP9C982ZsU3HyRhHtiiv3
	 gszYmRE48sLINaYxu8cfJK/7FOtxEmXM8BXAlHsqr5l56lUSjmGx8ybVzpMkJGsU8Dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795760610;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=VBIt+qdAst8yPVKvtQ+E8Xjhi1bgbwChpLbiiXzW4ME=;
	b=PDsYrDhXTpuTL0wxtijW84Cy0Q+eGwjCVfQOAdpr81WEBgaRaLxZgkrhTUdPFZNlCmrj
	 skidx/CUyoxgyWLu+Ef+H26oNsJNDbP6EZy+EYDlp3Pk1yUG85A2BhHT5qY/fC3YkSfJ7
	 pL3aiDx79brfrS+jo5rrvOy+jyvLKQHJOJggC+4z1i4nImUfwM2bH9mfuAVuB9BWaAITc
	 w46qQO4Vor85Bbt8mzO6/6bUFpfrvp9iChPCT3l9Iaut5NPeNqZUuNDmLSjfsRJUSvtYS
	 Scbzyt4vsTSIINxC/gJTrKGq9aC0Jr7TTrFyjAAwalBQAjpDTjd0hjxGbu64KiaQI+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=iT3g5sWi;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0EB606A337;
	Fri, 27 Nov 2026 06:23:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C0EB606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=iT3g5sWi
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AR6N9NY0730705, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795760589; bh=VBIt+qdAst8yPVKvtQ+E8Xjhi1bgbwChpLbiiXzW4ME=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=iT3g5sWiphHLMwLLLSxyart7ugUZ9bHBNmRdRwWTrSDAaT46JpfMGe3AXrvbfiynh
	 ZXB5Hs9pK6Xk678GIst3Px5w0wSCX1HbuyZv/kAy8vuQos/UOfLdv7tLyMA2Z597Nh
	 JpbAgTLThHDd8nbeRMYWe0cMBUF3gRdq/q1OXqKa+EIxKFJPlDA/mNE1KOecSxOrh/
	 Lm5nTt5YOL+xaKimNB1pQU8gAyY+vPST8vsbkBwtzdklesyyGBg+UTHiXAhzdvscbm
	 dzbIjz0sxgygvGSketkwwCN/bku8fF7eQNJVZ6XLWZNK4NhD+v6PIKZ2lu4T1Em5qD
	 vtiXpprTdiehg==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AR6N9NY0730705
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 27 Nov 2026 14:23:09 +0800
Received: from RTKEXHMBS01.realtek.com.tw (172.21.6.40) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 27 Nov 2026 14:23:09 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS01.realtek.com.tw (172.21.6.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 27 Nov 2026 14:23:09 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Fri, 27 Nov 2026 14:23:09 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Mehmet Fide <mehmet.fide@gmail.com>
CC: Luka Gejak <luka.gejak@linux.dev>, Bitterblue Smith
	<rtl8821cerfe2@gmail.com>, "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "mehmet.fide@screeningeagle.com"
	<mehmet.fide@screeningeagle.com>
Subject: RE: [PATCH rtw-next v14 2/3] wifi: rtw88: support channel switch in
 AP mode
Thread-Topic: [PATCH rtw-next v14 2/3] wifi: rtw88: support channel switch in
 AP mode
Thread-Index: AQHdee+p8j6aIxstNkarBQ/O0oJacrdBdPNg
Date: Fri, 27 Nov 2026 06:23:09 +0000
Message-ID: <84030084b4f24c4199a85cf05fae10b0@realtek.com>
References: <20261121193644.603289-1-mehmet.fide@gmail.com>
 <20261121193644.603289-3-mehmet.fide@gmail.com>
In-Reply-To: <20261121193644.603289-3-mehmet.fide@gmail.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Mehmet Fide <mehmet.fide@gmail.com> wrote:
> @@ -857,12 +878,16 @@ static int rtw_ops_suspend(struct ieee80211_hw *hw,
>                            struct cfg80211_wowlan *wowlan)
>  {
>         struct rtw_dev *rtwdev =3D hw->priv;
> +       struct ieee80211_vif *csa_vif;
>         int ret;
>=20
>         mutex_lock(&rtwdev->mutex);
> +       csa_vif =3D rtwdev->csa_vif;
> +       rtw_fw_csa_stop(rtwdev, csa_vif);
>         ret =3D rtw_wow_suspend(rtwdev, wowlan);
>         if (ret)
>                 rtw_err(rtwdev, "failed to suspend for wow %d\n", ret);
> +       rtwdev->csa_wow_vif =3D ret ? NULL : csa_vif;

Have you actually tested WoWLAN with AP mode operating CSA?=20
If not, I prefer not resuming CSA.=20

As I know, we can only support STA mode WoWLAN under single one interface
combination.

>         mutex_unlock(&rtwdev->mutex);
>=20
>         return ret ? 1 : 0;
> @@ -871,12 +896,18 @@ static int rtw_ops_suspend(struct ieee80211_hw *hw,
>  static int rtw_ops_resume(struct ieee80211_hw *hw)
>  {
>         struct rtw_dev *rtwdev =3D hw->priv;
> +       struct ieee80211_vif *csa_vif;
>         int ret;
>=20
>         mutex_lock(&rtwdev->mutex);
>         ret =3D rtw_wow_resume(rtwdev);
>         if (ret)
>                 rtw_err(rtwdev, "failed to resume for wow %d\n", ret);
> +       csa_vif =3D rtwdev->csa_wow_vif;
> +       rtwdev->csa_wow_vif =3D NULL;
> +       if (!ret && csa_vif && csa_vif->bss_conf.csa_active &&
> +           csa_vif->bss_conf.enable_beacon)
> +               rtw_fw_csa_start(rtwdev, csa_vif, false);
>         mutex_unlock(&rtwdev->mutex);
>=20
>         return ret ? 1 : 0;

[...]

> --- a/drivers/net/wireless/realtek/rtw88/main.h
> +++ b/drivers/net/wireless/realtek/rtw88/main.h
> @@ -2096,6 +2096,12 @@ struct rtw_dev {
>         struct work_struct ips_work;
>         struct work_struct fw_recovery_work;
>         struct work_struct update_beacon_work;
> +       struct delayed_work csa_beacon_work;
> +       struct ieee80211_vif *csa_vif;
> +       struct ieee80211_vif *csa_wow_vif;
> +       ktime_t csa_due;
> +       u8 csa_count;
> +       bool csa_retry;

Create a struct to hold these CSA data?

>=20
>         /* used to protect txqs list */
>         spinlock_t txq_lock;
> --
> 2.56.0

