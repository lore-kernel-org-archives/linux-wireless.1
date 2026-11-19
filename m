Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795065237;
	b=CC/Wx7ljwlQyNGQERAeXmabhFrK5IJb6PPBv7kr5/7FKoK+zNlONfUdp69I9ZuD0hAY1
	 Xb1w6/ydDRIc+xtoyxQ6O6oC27qrEhYwjlUM5zxXaArLISh7s8m/4XtOPPxIoq3JkH3eB
	 KB5uQRoVKA6Thhb9TrM2vwuqOEiRbL2dIIKac7OnAlmEM011u35KAjd2UZdyS6+MZ+u3w
	 /0mO7ogMh03u2N9pAVV0HLcQWz3bw7f/ezg/GsK/+bjoHT00CUhSTVowPiHAuLP7Xoj+Z
	 ZNznQNmhu5R96AvUTs3SlW8jXX1fOLHr4Z8zCyfgIccJswifKyTnhKFQ9oRS4PKwcnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795065237;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=Kr2jQSQ7nv86EM+p6bKl0HIL8K5Jez021A7GgSePSmo=;
	b=Oko4vxVWWrxz+m8roKhloXK6ie52xXI/OFdyRZ8xg921R7UoO6Bxx3hPOdNBNnsGbkWo
	 zxsLGKpLpZA45qyfJSEYNDlHrhiWb4JuZM9a7kKGr1jv5DT+F3pIHDSNFycHvFuLjtcnF
	 JH1tzjKA6u1EZMOLg8ISAs0bCmUTKRtg+OTwepDDwoor7Db7eq+sntfwTl6S9WCKbtv0m
	 ca/y615u+sWHZpRdCA09PmOLC9y2HiGCPNDY7c2l9BHu0g25Or6gE+E/X8InZ0LJbMAt1
	 +3petvTS7VvD1ei7KsC21/ocaQ9m476E8JboXHyUjslK/e9flN/6nBLJFSlIvp+DjqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=vO4oKTnT;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE29160A2636;
	Thu, 19 Nov 2026 05:13:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE29160A2636
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=vO4oKTnT
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AJ5DnbN62034425, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795065229; bh=Kr2jQSQ7nv86EM+p6bKl0HIL8K5Jez021A7GgSePSmo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=vO4oKTnTktoEHvNxFrMvPp8JEGVEvyD/LeqeKiga6Fk/8ESLRtB2Iaais5T+Ui0m3
	 MwmFs1nxcwpfExsCIr09c8ZH00VXYPONmY244RFg/KO6932CfzEgO6TaoYKC5vw/1+
	 Do7lbTKmVFu+S+U67OKYSMM6BUBHwbIfxA9qgDw9g0IYVg3id2PSoHkTWy2rlaTxyd
	 GVtJ+Skw1TS1hOXcIA3zqoOKjwIuAXB+7d5aJwE5nPF09a3FfuHX9O5iugAo0stfb+
	 Nxt4gDdme09jeP6iQNO4wznAKy2YYYS0MCOTIh20qViXRD81dD0zqzkOXx6mF+EBfZ
	 +92u2oePHuhSg==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AJ5DnbN62034425
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 19 Nov 2026 13:13:49 +0800
Received: from RTKEXHMBS03.realtek.com.tw (10.21.1.53) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 13:13:48 +0800
Received: from RTKEXHMBS03.realtek.com.tw ([fe80::d2b4:cd25:1a3e:aca8]) by
 RTKEXHMBS03.realtek.com.tw ([fe80::d2b4:cd25:1a3e:aca8%9]) with mapi id
 15.02.2562.056; Thu, 19 Nov 2026 13:13:48 +0800
From: Zong-Zhe Yang <kevin_yang@realtek.com>
To: Enver Ikromov <owner@ph4ntom-rev.uz>, Ping-Ke Shih <pkshih@realtek.com>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH rtw-next v7 3/5] wifi: rtw89: restore channel when leaving
 idle on non-chanctx devices
Thread-Topic: [PATCH rtw-next v7 3/5] wifi: rtw89: restore channel when
 leaving idle on non-chanctx devices
Thread-Index: AQHdd4ef5uoJrIHJe0KSxUpY5Obarrc02aHA
Date: Thu, 19 Nov 2026 05:13:48 +0000
Message-ID: <61ca0408d2ba4b0f8232881a5729990f@realtek.com>
References: <20261118180435.904-1-owner@ph4ntom-rev.uz>
 <20261118180435.904-4-owner@ph4ntom-rev.uz>
In-Reply-To: <20261118180435.904-4-owner@ph4ntom-rev.uz>
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
>  drivers/net/wireless/realtek/rtw89/mac80211.c | 7 +++++++
>  3 files changed, 9 insertions(+)
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
> index 7a55fed..98f4b5c 100644
> --- a/drivers/net/wireless/realtek/rtw89/mac80211.c
> +++ b/drivers/net/wireless/realtek/rtw89/mac80211.c
> @@ -97,6 +97,13 @@ static int rtw89_ops_config(struct ieee80211_hw *hw,
> int radio_idx, u32 changed)
>=20
>         rtw89_leave_ps_mode(rtwdev);
>=20
> +       if (!rtwdev->support_chanctx &&
> +           changed & IEEE80211_CONF_CHANGE_IDLE &&
> +           changed & IEEE80211_CONF_CHANGE_MONITOR &&
> +           !(hw->conf.flags & IEEE80211_CONF_IDLE) &&
> +           hw->conf.flags & IEEE80211_CONF_MONITOR)
> +               changed |=3D IEEE80211_CONF_CHANGE_CHANNEL;
> +
>         if ((changed & IEEE80211_CONF_CHANGE_IDLE) &&
>             !(hw->conf.flags & IEEE80211_CONF_IDLE))
>                 rtw89_leave_ips(rtwdev);
> --
> 2.56.0.windows.4
>=20

Looks good to me
