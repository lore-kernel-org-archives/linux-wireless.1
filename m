Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795764464;
	b=kOUzHqM3T4fDQcnvsEoY8dGvVUmZIGwBiow7hBmdNj8WM3p7aAmVAaDCDE4wSj2Jbskm
	 pg+ECePpEDjQWn4kHDUEK96TkxvYB7o0iHbtqZAUYhq4j8lzk7OUN7t5uGPX4FT2xLI3R
	 9QH/bMz4D5o9oGkKEUssFtFrGnbFZ5MmPUXFHZtVor2GTiGUOkwTlyQgdbj0UIg2Yq7Dw
	 kpMyZ5v4ak/Bf1t3KjW49RVLMm/ZOWqO7Zg9cHgz8kmmP0iC8tOvWonet7ZAqdQTIlCxD
	 jQoYFNwAsfxZXEJqX9oj18Ue58AkO1kTKMDwaVXm12/Au08u4tG5PRmEeleODgNq5cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795764464;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=6h2VEjUJ9OYbFuelv8eX8d40TLpNiTN6XRXrVD9NLCc=;
	b=WbWZ5J+j2IAAx2L1ieYl5SHsbhSYIzl0izbMIsVod/AJGYaPuV3NOspLMOz6AjYnl3A8
	 YzjjffImkiy3GR6kc50k1L90d+/6ByltrbJ18uPwfKOeMpppUD6bs02BpqbpZxlU+7nlI
	 bj5sxJ/dM+CAF/0EZQaClyrkEV4FHqLwIc+PNH1HxfBoH0x8CFizrxalGvvtUuKJZIB5z
	 Aui7bsYOJZft87iYqG9sIOgf1zYN66HHRPdJx5yRZJ28FjWZYK6/xjY9tAzMcoWG47k8C
	 XC5ZSc54s+YcYuPsRxprXs464MCDqBqJ92aH9h1PGzJJzVmVjHTl/mLdOaQ/nBbESVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b="G/iI3oKh";
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6D9606A687;
	Fri, 27 Nov 2026 07:27:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A6D9606A687
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=G/iI3oKh
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AR7RDf24755729, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795764434; bh=6h2VEjUJ9OYbFuelv8eX8d40TLpNiTN6XRXrVD9NLCc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=G/iI3oKhZdRPqWrw8ZyOVCS6Q6iUvqmpRWfeyseRHKyJGSaNimNu2ysG2D0Rn2aKK
	 3yPkskp3sHpGtcvp37siD9qkpI2AZLGS2FwvtFlUONRgaJOBxogVUnUgjsThxnQVEH
	 wAE0rujB7yXqCgeACTeREgT7SV5oQKAJSvYrK4anT6fw8oqENSoTKrY6VAnayUbxKu
	 jULocYxCcmJaqDiWXnBtk96T3AHP8GyewSGohbLR+N5nYDVgVdfy6nky/szcZn4pO1
	 U7JvyLg1UxWU+OhAlC0WIXdHZE1pWqRlUH17ZARiF+tiKBYUeS46F6nYqXKsrvVQqm
	 AlfVRLbi3buEg==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AR7RDf24755729
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 27 Nov 2026 15:27:13 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 27 Nov 2026 15:27:13 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 27 Nov 2026 15:27:12 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Fri, 27 Nov 2026 15:27:12 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Enver Ikromov <owner@ph4ntom-rev.uz>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "Ahmet
 Zeren" <niko3x@proton.me>, Luka Gejak <luka.gejak@linux.dev>, "Bitterblue
 Smith" <rtl8821cerfe2@gmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH rtw-next 1/2] wifi: rtw89: fix retry limit and NO_ACK
 status for injected frames
Thread-Topic: [PATCH rtw-next 1/2] wifi: rtw89: fix retry limit and NO_ACK
 status for injected frames
Thread-Index: AQHdfYDfe0tgBtSsfEy+aX+JF/+RGLdBgwoA
Date: Fri, 27 Nov 2026 07:27:12 +0000
Message-ID: <06298e2d51ca45e482165b9c7bdbfdf3@realtek.com>
References: <20261126083141.1470-1-owner@ph4ntom-rev.uz>
 <20261126083141.1470-2-owner@ph4ntom-rev.uz>
In-Reply-To: <20261126083141.1470-2-owner@ph4ntom-rev.uz>
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

Enver Ikromov <owner@ph4ntom-rev.uz> wrote:
> Commit 92608bb5f14f ("wifi: rtw89: honor ASSIGN_SEQ, retries, and
> NO_ACK for injected frames") has three issues:

Your Fixes tag has said this.

>=20
> 1. rtw89_core_tx_update_injection() uses info->control.rates[0].count
>    without checking IEEE80211_TX_CTRL_RATE_INJECT. When a radiotap rate
>    is unsupported on the current band or stream capability,
>    ieee80211_parse_tx_radiotap() clears IEEE80211_TX_CTRL_RATE_INJECT
>    while still populating rates[0].count. Gate the per-packet retry
>    override on IEEE80211_TX_CTRL_RATE_INJECT.
>=20
> 2. hw->max_rate_tries is set to RTW89_TX_DATA_CNT_LMT_MAX (63), which
>    exceeds the 5-bit struct ieee80211_tx_rate::count field and causes
>    radiotap retry counts above 30 to wrap around. Set
>    hw->max_rate_tries to IEEE80211_MAX_TX_RETRY (31) and drop the
>    unused macro.
>=20
> 3. rtw89_tx_rpt_tx_status() sets IEEE80211_TX_STAT_NOACK_TRANSMITTED
>    unconditionally for NO_ACK frames (including RTW89_TX_MACID_DROP and
>    RTW89_TX_LIFE_TIME)=20

I don't know why there is a problem?

> and also sets IEEE80211_TX_STAT_ACK when
>    tx_status =3D=3D RTW89_TX_DONE. Because Wi-Fi 6 AX chips lack a TX
>    descriptor NO_ACK bit and implement NO_ACK via tx_cnt_lmt =3D 1,
>    unacknowledged unicast NO_ACK frames complete with
>    RTW89_TX_RETRY_LIMIT, whereas broadcast, QoS No-Ack, and Wi-Fi 7 BE
>    NO_ACK frames complete with RTW89_TX_DONE. Clear stale status bits
>    and report IEEE80211_TX_STAT_NOACK_TRANSMITTED exclusively on
>    RTW89_TX_DONE or RTW89_TX_RETRY_LIMIT, reserving
>    IEEE80211_TX_STAT_ACK for frames without IEEE80211_TX_CTL_NO_ACK.

Generated by LLM? Can you reword commit message yourself?

>=20
> Fixes: 92608bb5f14f ("wifi: rtw89: honor ASSIGN_SEQ, retries, and NO_ACK =
for injected frames")
> Reported-by: Luka Gejak <luka.gejak@linux.dev>
> Closes: https://lore.kernel.org/linux-wireless/7904907C-A864-4DE9-AE9B-65=
082A38B29B@linux.dev/
> Reported-by: Ahmet Zeren <niko3x@proton.me>
> Closes:
> https://lore.kernel.org/linux-wireless/Qmyu_zaapR7fisQhYB1W9CDM3OG849otNX=
R4xWRbIaRocvy40VyY4N2Jte4
> IHqD33nCI_txHle2bL5F7S0b6Bv_uXvCyk9MJ35CFHWzopyE=3D@proton.me/
> Signed-off-by: Enver Ikromov <owner@ph4ntom-rev.uz>
> ---
>  drivers/net/wireless/realtek/rtw89/core.c |  5 +++--
>  drivers/net/wireless/realtek/rtw89/core.h |  1 -
>  drivers/net/wireless/realtek/rtw89/mac.h  | 13 ++++++++-----
>  3 files changed, 11 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/net/wireless/realtek/rtw89/core.c b/drivers/net/wire=
less/realtek/rtw89/core.c
> index 31d52fb99..8421c78c2 100644
> --- a/drivers/net/wireless/realtek/rtw89/core.c
> +++ b/drivers/net/wireless/realtek/rtw89/core.c
> @@ -1274,7 +1274,8 @@ static void rtw89_core_tx_update_injection(struct r=
tw89_dev *rtwdev,
>                 desc_info->no_ack =3D true;
>                 desc_info->tx_cnt_lmt_en =3D true;
>                 desc_info->tx_cnt_lmt =3D 1;
> -       } else if (info->control.rates[0].count) {
> +       } else if ((info->control.flags & IEEE80211_TX_CTRL_RATE_INJECT) =
&&

No need parenthesis for ( & )

> +                  info->control.rates[0].count) {
>                 desc_info->tx_cnt_lmt_en =3D true;
>                 desc_info->tx_cnt_lmt =3D info->control.rates[0].count;
>         }
> @@ -7561,7 +7562,7 @@ static int rtw89_core_register_hw(struct rtw89_dev =
*rtwdev)
>         hw->queues =3D IEEE80211_NUM_ACS;
>         hw->max_rx_aggregation_subframes =3D chip->max_rx_agg_num;
>         hw->max_tx_aggregation_subframes =3D chip->max_tx_agg_num;
> -       hw->max_rate_tries =3D RTW89_TX_DATA_CNT_LMT_MAX;
> +       hw->max_rate_tries =3D IEEE80211_MAX_TX_RETRY;
>         hw->uapsd_max_sp_len =3D IEEE80211_WMM_IE_STA_QOSINFO_SP_ALL;
>=20
>         hw->radiotap_mcs_details |=3D IEEE80211_RADIOTAP_MCS_HAVE_FEC |
> diff --git a/drivers/net/wireless/realtek/rtw89/core.h b/drivers/net/wire=
less/realtek/rtw89/core.h
> index 87a832b5c..612389f32 100644
> --- a/drivers/net/wireless/realtek/rtw89/core.h
> +++ b/drivers/net/wireless/realtek/rtw89/core.h
> @@ -1278,7 +1278,6 @@ struct rtw89_tx_desc_info {
>         bool tx_cnt_lmt_en;
>         u8 sn: 4;
>         u8 tx_cnt_lmt: 6;
> -#define RTW89_TX_DATA_CNT_LMT_MAX      0x3f

You need to consider min of driver and ieee80211, so maybe
    min(0x3f, IEEE80211_MAX_TX_RETRY)

The logic is clearer.=20

>         u8 addr_info_nr;
>         u8 sec_keyid;
>         u8 sec_type;
> diff --git a/drivers/net/wireless/realtek/rtw89/mac.h b/drivers/net/wirel=
ess/realtek/rtw89/mac.h
> index c94b34b92..5c3af59d1 100644
> --- a/drivers/net/wireless/realtek/rtw89/mac.h
> +++ b/drivers/net/wireless/realtek/rtw89/mac.h
> @@ -1896,12 +1896,15 @@ void rtw89_tx_rpt_tx_status(struct rtw89_dev *rtw=
dev, struct sk_buff *skb,
>         info =3D IEEE80211_SKB_CB(skb);
>         ieee80211_tx_info_clear_status(info);
>=20
> -       if (info->flags & IEEE80211_TX_CTL_NO_ACK)
> -               info->flags |=3D IEEE80211_TX_STAT_NOACK_TRANSMITTED;
> -       if (tx_status =3D=3D RTW89_TX_DONE)
> +       info->flags &=3D ~(IEEE80211_TX_STAT_NOACK_TRANSMITTED |
> +                        IEEE80211_TX_STAT_ACK);

Why do you need to clear these two bits ahead?

> +       if (info->flags & IEEE80211_TX_CTL_NO_ACK) {
> +               if (tx_status =3D=3D RTW89_TX_DONE ||
> +                   tx_status =3D=3D RTW89_TX_RETRY_LIMIT)
> +                       info->flags |=3D IEEE80211_TX_STAT_NOACK_TRANSMIT=
TED;
> +       } else if (tx_status =3D=3D RTW89_TX_DONE) {
>                 info->flags |=3D IEEE80211_TX_STAT_ACK;
> -       else
> -               info->flags &=3D ~IEEE80211_TX_STAT_ACK;

I think the original ~IEEE80211_TX_STAT_ACK is not necessary.=20

> +       }
>=20
>         ieee80211_tx_status_irqsafe(rtwdev->hw, skb);
>  }
> --
> 2.53.0

pw-bot: cr



