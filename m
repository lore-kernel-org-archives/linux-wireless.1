Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794367367;
	b=AsPyT+V+7howV8YZAgLJiRt117PO5BG6K8Q9Sy7GNDrKmTf4lpkEmDPeNdc5owxhfbMa
	 TwX/eSUyvKR4442BZGMdPVw5YzK7RJ4PCzyDjrTe0XjFA+lLaKx9BxC94lM8TB7I9Kq5a
	 R9dRjpJMrdf4CpS5JPdVO+veaasuU94H8pSo+YHOEZkS2JjfjHlsFWyJ65yefQIzcmCie
	 iNezQdNgfS4N+ciGNgT2GXo4p88oap9sUk8tdxzSEX4zIeWXoNXIMNs5HStJOoBeMsBvb
	 qIMsl4aA8kmx85w8a8yvK4ieoZ/5LSj5gQN7AjJaC7Q0cZus6GlxWWTvU6XhHRWxsYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794367367;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=UX2JzbbuXC4wBQWZYp/vc1RUTM+u+sADy0nG3uO1sRg=;
	b=OSKdOAVH0hcc5KgoJUQs265p+KbeHrbe4QK2FlgeMjuNzN9TCwzdtaA5gdo5kwwvzsDA
	 KV1/KDeBdVixolxqgsTxqi/D7ZU9dQtB0ES+r5++4lytahkW/ofznZ5kanOnNI15NTeKo
	 hPXyNDs6EAkR29gWrONk52l11ZznWhNSvMdj3rV/QQ7DkE/Rmc+kGdVOVA00kXBhNQ+sH
	 BCbbtdxTRMyht8WkKOt39XacwdTL1f/10cklo5Zx7NNL2PpAEWXxKeov5QbM1ygMK71G0
	 viEbnvTSBrMkcRbuw/FlGc8nXO2UwGELI/vkmweq8ibiHpg57HSM7Wo2yDcQJo9dFmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=JWTciNmt;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4180E606A31C
	for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 03:22:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4180E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=JWTciNmt
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AB3MezQ62010195, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794367360; bh=UX2JzbbuXC4wBQWZYp/vc1RUTM+u+sADy0nG3uO1sRg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=JWTciNmtNktChqkBfYr//wiyQkmAPq1ondEvKY88B72yrfPNnUegE+nxfQ8f6UJOX
	 Bwja6kp0ixKk/z8+/KnmY+SKdEFj3gC8dJ9eOXUagT1bcn8M06BcKgdcKWE5SkhEk9
	 NiLzb1o4YwvMOSAmB0at8MgVYJo8IeBYvmi/fm2fruLnPU9HbPIgseWWRksTfRhqq8
	 P/YYnCX7ekSMEBOMK3mji0K/3TDkKfuo4aXEYLYdYReJU83fzyfo86PkOtm9O80j/I
	 VSWOF34sNEkbel6Vsu3X1a0kjrW1T4lmV0FcPkKcpipYDyYG3uMCt44D/VL0mcJstY
	 lE0PKvFD2RfJA==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AB3MezQ62010195
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 11 Nov 2026 11:22:40 +0800
Received: from RTKEXHMBS01.realtek.com.tw (172.21.6.40) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 11 Nov 2026 11:22:41 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS01.realtek.com.tw (172.21.6.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 11 Nov 2026 11:22:40 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Wed, 11 Nov 2026 11:22:40 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: acio <spam@acio.nl>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Subject: RE: [PATCH rtw-next] wifi: rtw89: do RA association again when the
 station RSSI is known
Thread-Topic: [PATCH rtw-next] wifi: rtw89: do RA association again when the
 station RSSI is known
Thread-Index: AQHdb4ORAbG0ONTG/E6BOmOw6vldwLcoNwoQ
Date: Wed, 11 Nov 2026 03:22:40 +0000
Message-ID: <d1d88bf5d1ef461dbb55988f906892b5@realtek.com>
References: <20261108131723.206533-1-spam@acio.nl>
In-Reply-To: <20261108131723.206533-1-spam@acio.nl>
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

acio <spam@acio.nl> wrote:
> From: Vincent Schurink <spam@acio.nl>
>=20
> When a station associates to an AP, the AP does not know the RSSI of
> the station yet. Thus, rtw89_phy_ra_assoc() sends init_rate_lv 0 to the
> firmware. With this value, the firmware RA of RTL8922A uses 20 MHz and
> VHT-MCS 2 for the station. The firmware RA does not try a higher rate,
> also when the PER is 0. On an 80 MHz AP, the TCP throughput to the
> station stays at approximately 35 Mbit/s.
>=20
> Set a flag when the RSSI is not known at the RA association. When the
> RSSI is known, the periodic RA update does the RA association again.
>=20
> Tested on RTL8912AU (RTL8922A, USB) in AP mode with hostapd 2.10 and
> VHT 80 MHz. The client is an Intel Meteor Lake CNVi (iwlwifi) at
> -45 dBm.
> Before: TX rate VHT-MCS 2 at 20 MHz, TCP 35 Mbit/s.
> After: TX rate VHT-MCS 7 to 9 at 80 MHz, TCP 186 to 320 Mbit/s.
>=20
> Signed-off-by: Vincent Schurink <spam@acio.nl>
> ---
>  drivers/net/wireless/realtek/rtw89/core.h |  1 +
>  drivers/net/wireless/realtek/rtw89/phy.c  | 14 ++++++++++++++
>  2 files changed, 15 insertions(+)
>=20
> diff --git a/drivers/net/wireless/realtek/rtw89/core.h b/drivers/net/wire=
less/realtek/rtw89/core.h
> index 0d893b992a4..ca5f2aced33 100644
> --- a/drivers/net/wireless/realtek/rtw89/core.h
> +++ b/drivers/net/wireless/realtek/rtw89/core.h
> @@ -4711,6 +4711,7 @@ struct rtw89_sta_link {
>         struct rtw89_vif_link *rtwvif_link;
>         struct rtw89_ra_info ra;
>         struct rtw89_ra_report ra_report;
> +       bool ra_rssi_unknown;
>         int max_agg_wait;
>         u8 prev_rssi;
>         struct ewma_rssi avg_rssi;
> diff --git a/drivers/net/wireless/realtek/rtw89/phy.c b/drivers/net/wirel=
ess/realtek/rtw89/phy.c
> index 795920b899d..96660b781a5 100644
> --- a/drivers/net/wireless/realtek/rtw89/phy.c
> +++ b/drivers/net/wireless/realtek/rtw89/phy.c
> @@ -717,6 +717,19 @@ void rtw89_phy_rate_pattern_vif(struct rtw89_dev *rt=
wdev,
>  static void rtw89_phy_ra_update_sta_iter(void *data, struct ieee80211_st=
a *sta)
>  {
>         struct rtw89_dev *rtwdev =3D (struct rtw89_dev *)data;
> +       struct rtw89_sta *rtwsta =3D sta_to_rtwsta(sta);
> +       struct rtw89_sta_link *rtwsta_link;
> +       unsigned int link_id;
> +       u8 rssi;
> +
> +       rtw89_sta_for_each_link(rtwsta, rtwsta_link, link_id) {
> +               if (!rtwsta_link->ra_rssi_unknown)
> +                       continue;
> +
> +               rssi =3D ewma_rssi_read(&rtwsta_link->avg_rssi) >> RSSI_F=
ACTOR;
> +               if (rssi > 1)
> +                       rtw89_phy_ra_assoc(rtwdev, rtwsta_link);

Can we move rssi logic to an individual function and call it to update
ra->init_rate_lv?

	if (rssi > 40)
		ra->init_rate_lv =3D 1;
	else if (rssi > 20)
		ra->init_rate_lv =3D 2;
	else if (rssi > 1)
		ra->init_rate_lv =3D 3;
	else
		ra->init_rate_lv =3D 0;

The rtw89_phy_ra_update_sta() will call rtw89_fw_h2c_ra() to send H2C comma=
nd.


> +       }
>=20
>         rtw89_phy_ra_update_sta(rtwdev, sta, IEEE80211_RC_SUPP_RATES_CHAN=
GED);
>  }
> @@ -755,6 +768,7 @@ void rtw89_phy_ra_assoc(struct rtw89_dev *rtwdev, str=
uct rtw89_sta_link *rtwsta_
>                 ra->init_rate_lv =3D 3;
>         else
>                 ra->init_rate_lv =3D 0;
> +       rtwsta_link->ra_rssi_unknown =3D rssi <=3D 1;
>         ra->upd_all =3D 1;
>         rtw89_debug(rtwdev, RTW89_DBG_RA,
>                     "ra assoc: macid =3D %d, mode =3D %d, bw =3D %d, nss =
=3D %d, lv =3D %d",
> --
> 2.53.0

