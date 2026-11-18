Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794983417;
	b=aUp9rlVs+ZpZy9IEJfh3oD/Yue+91kfJOzfZody+NHr1uBbYAM6LuR/HuLe+GS/TbNWD
	 V4b6o2qhTRKRtScdwcObCHY3+p1bnX2+hA1AQLrVDXVABaLgZ/a2M4w8ymhstyNx4ef9c
	 meKekdTqGbS58FkwrwlUevv/ezQOAcyS0gWsStqbXkzXoqEvzvvAA10x162n8Vn5FrrFp
	 9MSEGdITH/QScwc71LdjNBO3xH3QHolctDc12LaY0xNiRGy9uLkmBBcVXRG5eKzOZv+Zy
	 wL6MZQRrOihBHQWMixQahemH2fbgtI5K32kDjdTR/dkJq6FjuZWSArI/qXd9rMOxaQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794983417;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=LQ2NaypxML8JTGTUBKzYR9CcHJ8rH4mpXEv1MaJJbmM=;
	b=WC1Pe6Vvth29lNuY7CuqD7KlXRhvVOnvGN6CQ5B6rUrVkud8DVNa6nhmuhAeLRrHqsZg
	 /UPPTDs48B54+kd+Iu95amp8J5dQcSIvlpTE6Ws3IaBcDUQnqNekmNO3VToq8Zn985yDz
	 FvY0AGJy5UklDYgyPeS2DCFnLUCz1gAxb3T02Ez39RTUZ/L67l6qdcUiKBr4yLDoBHlli
	 ESKx3bSRDQKhKGycqtfwDVCIw49KlM8aMYX/Vd86O/6vBC83XsiNGER7P6KGjHvDegbYh
	 +ctDDaESl36Tt68f90RoRL4vZRAw8Oqb7mmhWXQK4L7k+VtUdIwL8K7yMfHl9jnqlkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b="EJmV/FVP";
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D633E606A325;
	Wed, 18 Nov 2026 06:30:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D633E606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=EJmV/FVP
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AI6U1LH01114354, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794983402; bh=LQ2NaypxML8JTGTUBKzYR9CcHJ8rH4mpXEv1MaJJbmM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=EJmV/FVPJmRMx3sRhKbSk/SLTlB/1yu5Gha+fV+1a2srKdkjYy3mFMsYAs312t3b1
	 bXb9t+WGrpuswDPAJtLkWR9kqBsNyjfe6PFFOYO/K6XIBS4h2wpdYsJrrnWHWV/bJq
	 flJnX/++LYvsyrHv/8mVkUsWqJ5yycFbr0Oba6mCQv1MKYhhYRZCy+urWKsCTEmJvq
	 gQABXqBEd1mYyo9OgY0HTKSfnHWOGfHL13ymlndDXI5PsxC8ubPlfEFkpZ0DhMBd3n
	 kCSqwRwNEabcT8TcugWumWqWgm8SUVt3p7TBSykVjcydQuDvkZ5+Avk+B4Kh/EAPo1
	 FZzSHSqsYOxOg==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AI6U1LH01114354
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 18 Nov 2026 14:30:01 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 14:30:01 +0800
Received: from RTKEXHMBS03.realtek.com.tw (10.21.1.53) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 14:30:01 +0800
Received: from RTKEXHMBS03.realtek.com.tw ([fe80::d2b4:cd25:1a3e:aca8]) by
 RTKEXHMBS03.realtek.com.tw ([fe80::d2b4:cd25:1a3e:aca8%9]) with mapi id
 15.02.2562.056; Wed, 18 Nov 2026 14:30:01 +0800
From: Zong-Zhe Yang <kevin_yang@realtek.com>
To: Enver Ikromov <owner@ph4ntom-rev.uz>, Ping-Ke Shih <pkshih@realtek.com>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH rtw-next v6 3/5] wifi: rtw89: restore channel when leaving
 idle on non-chanctx devices
Thread-Topic: [PATCH rtw-next v6 3/5] wifi: rtw89: restore channel when
 leaving idle on non-chanctx devices
Thread-Index: AQHddnhiBoimoJECfEGMROYM00YmDrczVbIw
Date: Wed, 18 Nov 2026 06:30:01 +0000
Message-ID: <92ec08f2829441c78c7b2265d931326a@realtek.com>
References: <20261117094135.1772-1-owner@ph4ntom-rev.uz>
 <20261117094135.1772-4-owner@ph4ntom-rev.uz>
In-Reply-To: <20261117094135.1772-4-owner@ph4ntom-rev.uz>
Accept-Language: zh-TW, en-US
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

Enver Ikromov <owner@ph4ntom-rev.uz> wrote:
>=20
> Fix the operating channel not being restored after bringing a monitor
> interface down and back up on devices that do not use native chanctx
> callbacks (such as RTL8852AE when firmware lacks beacon filtering).
>=20
> Stopping the interface powers down the PHY while mac80211 retains the
> previous chandef and omits IEEE80211_CONF_CHANGE_CHANNEL on restart.
> Record support_chanctx in rtwdev and set
> IEEE80211_CONF_CHANGE_CHANNEL
> when re-entering monitor mode from idle on non-chanctx devices so the
> channel is applied again.
>=20
> Signed-off-by: Enver Ikromov <owner@ph4ntom-rev.uz>
> ---
>  drivers/net/wireless/realtek/rtw89/core.c     | 1 +
>  drivers/net/wireless/realtek/rtw89/core.h     | 1 +
>  drivers/net/wireless/realtek/rtw89/mac80211.c | 9 +++++++++
>  3 files changed, 11 insertions(+)
>=20
> diff --git a/drivers/net/wireless/realtek/rtw89/core.c
> b/drivers/net/wireless/realtek/rtw89/core.c
> index 37ff745..8333b26 100644
> --- a/drivers/net/wireless/realtek/rtw89/core.c
> +++ b/drivers/net/wireless/realtek/rtw89/core.c
> @@ -7761,6 +7761,7 @@ struct rtw89_dev
> *rtw89_alloc_ieee80211_hw(struct device *device,
>         rtwdev->board =3D info->board;
>         rtwdev->fw.req.firmware =3D firmware;
>         rtwdev->fw.fw_format =3D fw_format;
> +       rtwdev->support_chanctx =3D !no_chanctx;
>         rtwdev->support_mlo =3D support_mlo;
>=20
>         bitmap_copy(rtwdev->quirks, &chip->default_quirks,
> NUM_OF_RTW89_QUIRKS);
> diff --git a/drivers/net/wireless/realtek/rtw89/core.h
> b/drivers/net/wireless/realtek/rtw89/core.h
> index 8e93cf1..780ec47 100644
> --- a/drivers/net/wireless/realtek/rtw89/core.h
> +++ b/drivers/net/wireless/realtek/rtw89/core.h
> @@ -7703,6 +7703,7 @@ struct rtw89_dev {
>         const struct rtw89_io_ops *io;
>=20
>         bool dbcc_en;
> +       bool support_chanctx;
>         bool support_mlo;
>         enum rtw89_mlo_dbcc_mode mlo_dbcc_mode;
>         struct rtw89_hw_scan_info scan_info;
> diff --git a/drivers/net/wireless/realtek/rtw89/mac80211.c
> b/drivers/net/wireless/realtek/rtw89/mac80211.c
> index 7a55fed..a385e57 100644
> --- a/drivers/net/wireless/realtek/rtw89/mac80211.c
> +++ b/drivers/net/wireless/realtek/rtw89/mac80211.c
> @@ -89,6 +89,7 @@ static void rtw89_ops_stop(struct ieee80211_hw *hw,
> bool suspend)
>  static int rtw89_ops_config(struct ieee80211_hw *hw, int radio_idx, u32
> changed)
>  {
>         struct rtw89_dev *rtwdev =3D hw->priv;
> +       bool no_chanctx =3D !rtwdev->support_chanctx;
>=20
>         lockdep_assert_wiphy(hw->wiphy);
>=20
> @@ -97,6 +98,14 @@ static int rtw89_ops_config(struct ieee80211_hw *hw,
> int radio_idx, u32 changed)
>=20
>         rtw89_leave_ps_mode(rtwdev);
>=20
> +       if (no_chanctx &&
> +           (changed & (IEEE80211_CONF_CHANGE_IDLE |
> +                       IEEE80211_CONF_CHANGE_MONITOR)) =3D=3D
> +           (IEEE80211_CONF_CHANGE_IDLE |
> IEEE80211_CONF_CHANGE_MONITOR)) {
> +               if (!(hw->conf.flags & IEEE80211_CONF_IDLE))

How about

    If (!rtwdev->support_chanctx &&
      changed & IEEE80211_CONF_CHANGE_IDLE &&
      changed & IEEE80211_CONF_CHANGE_ MONITOR &&
      !(hw->conf.flags & IEEE80211_CONF_IDLE))

Additionally,
    (changed & (IEEE80211_CONF_CHANGE_IDLE |
              IEEE80211_CONF_CHANGE_MONITOR))
seems to be true for any first iface (even if not a monitor) by
ieee80211_hw_conf_init(). So, perhaps the condition should be

    If (!rtwdev->support_chanctx &&
      changed & IEEE80211_CONF_CHANGE_IDLE &&
      changed & IEEE80211_CONF_CHANGE_ MONITOR &&
      !(hw->conf.flags & IEEE80211_CONF_IDLE) &&
      hw->conf.flags & IEEE80211_CONF_MONITOR)

> +                       changed |=3D
> IEEE80211_CONF_CHANGE_CHANNEL;
> +       }
> +
>         if ((changed & IEEE80211_CONF_CHANGE_IDLE) &&
>             !(hw->conf.flags & IEEE80211_CONF_IDLE))
>                 rtw89_leave_ips(rtwdev);
> --
> 2.56.0.windows.4

