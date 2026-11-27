Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795764762;
	b=zVefWCSOJ25TQ8B+IbAhDoM/WHizzesVPMX0UL37Ibchytn35SwajQDWfVNv94biOQzQ
	 9M4PPkJ8kTw1KGYrKcbkITxCY7jsRL5GkUqSgq9DRL3Bzyg4Too0fx/gnxXHDU243lMUZ
	 g4MfiigGQUVEwmh5qybrHByYzxv1vZy7g/tqq5YcbaP5cG5NHvk7j3k0qRqLxQYsNl84n
	 pfQD4fe3st+WDQ84DIjYZJguOQf9SrIMrlR9SMxmJhcG+wDtZrj2Zm6iqJAX2JgMliqlw
	 gX1UH9XqgUe/vmNvqKv2L/Pe0XzmQ+yrV81AGPKCBHVmgmpEZY5Hde/qLH03iH88A5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795764762;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=ctG22fW/HiZkaBo9C00mdOf6CVhfrrsJKkExP1EsM6w=;
	b=JHT7QsDEDWFi/E0AOoPgCAlbXT+NFf8NjDqkBiPvb/UdexXmpWcFlbC94VrYcQI+njru
	 TTtwx+K3DV6wtCzmPLdio29jIlyx0TFmevWCQVuHdjjIRP2IE4qj9EM0cixLErx4jV1q7
	 FV2r1dJ0J0hpSAoTvqWzjq12VqYotNBy6Vmy/60iXDl0Gkd49OGPXNEs5lk/1Sssn1Tv4
	 2Fq07LPagBC1E796RHxinF4LUJJvnUc3xML3eFnXFk6EIJ7/ISx7zZcwqBWatPwVN968N
	 DVouM2PV9/AU3auuCHWdMfoUA+sZgQdDj1Pet6VF4JoObcyA+6jPXYf60c9N921Xl4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=oY5aGtac;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B22606A326;
	Fri, 27 Nov 2026 07:32:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77B22606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=oY5aGtac
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AR7WDBI0757430, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795764733; bh=ctG22fW/HiZkaBo9C00mdOf6CVhfrrsJKkExP1EsM6w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=oY5aGtacCWJ034gp9s95OFdpTqykIJtXjoY9YKDrm2SCmLD/GZSszR4oRwVE0mPfE
	 nl+BYG6M5QxzhmUjDObFC/4EzMbEwr4i0C3PFoAMq9/kv3DKfeju2aBIaxeOo2g59b
	 zL5IY2pKhuLoZ+LdnsA7K85rO0xJlC0sAGVM+ORBtIGy4cGh0QplvP9lY+aTo926c3
	 CFv1fGNujp+22tOOutk5I9f6jM+QQTcID7mwyegM5EA2A+Q8bH/4eiMek6rdUuv3ud
	 kARnx5y9fofBsZM0SQPSdzo/m5Vv292xGkpnvg1R7NDg8C0UBUOWXGmKD79+0+7Ggl
	 M91l0Bm1fsr8w==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AR7WDBI0757430
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 27 Nov 2026 15:32:13 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 27 Nov 2026 15:32:13 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Fri, 27 Nov 2026 15:32:13 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Enver Ikromov <owner@ph4ntom-rev.uz>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "Ahmet
 Zeren" <niko3x@proton.me>, Luka Gejak <luka.gejak@linux.dev>, Bitterblue
 Smith <rtl8821cerfe2@gmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH rtw-next 2/2] wifi: rtw89: pci: fix TX status and counters
 for NO_ACK frames
Thread-Topic: [PATCH rtw-next 2/2] wifi: rtw89: pci: fix TX status and
 counters for NO_ACK frames
Thread-Index: AQHdfYEInk59l7iHakqef0+uV6cbBLdBhn8w
Date: Fri, 27 Nov 2026 07:32:13 +0000
Message-ID: <355183d7bab743e99e3d8bac03d80ed8@realtek.com>
References: <20261126083141.1470-1-owner@ph4ntom-rev.uz>
 <20261126083141.1470-3-owner@ph4ntom-rev.uz>
In-Reply-To: <20261126083141.1470-3-owner@ph4ntom-rev.uz>
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
> In rtw89_pci_tx_status(), IEEE80211_TX_STAT_NOACK_TRANSMITTED is set
> unconditionally whenever IEEE80211_TX_CTL_NO_ACK is present, even when
> the frame was dropped (RTW89_TX_MACID_DROP or RTW89_TX_LIFE_TIME)
> without being transmitted.=20

What is the problem?

Set it only if successfully transmit?

> In addition, when a NO_ACK frame completes
> with RTW89_TX_DONE (broadcast, QoS No-Ack, or Wi-Fi 7 BE NO_ACK), the
> subsequent RTW89_TX_DONE branch also sets IEEE80211_TX_STAT_ACK and
> increments tx_ring->tx_acked, whereas unacknowledged Wi-Fi 6 AX unicast
> NO_ACK frames (tx_cnt_lmt =3D 1) complete with RTW89_TX_RETRY_LIMIT and
> fall into the failure path.
>=20
> Clear stale TX status bits and set IEEE80211_TX_STAT_NOACK_TRANSMITTED
> exclusively when a NO_ACK frame completes with RTW89_TX_DONE or
> RTW89_TX_RETRY_LIMIT, reserving IEEE80211_TX_STAT_ACK and
> tx_ring->tx_acked for non-NO_ACK completions while still accounting
> RTW89_TX_LIFE_TIME and RTW89_TX_MACID_DROP as failures.

I think no need this.=20

>=20
> Fixes: e3ec7017f6a2 ("rtw89: add Realtek 802.11ax driver")
> Cc: stable@vger.kernel.org

I don't think this a big deal. It looks like we have Fixes/Cc stable everyw=
here...

> Signed-off-by: Enver Ikromov <owner@ph4ntom-rev.uz>
> ---
>  drivers/net/wireless/realtek/rtw89/pci.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/net/wireless/realtek/rtw89/pci.c b/drivers/net/wirel=
ess/realtek/rtw89/pci.c
> index 76523d057..2204ed8c5 100644
> --- a/drivers/net/wireless/realtek/rtw89/pci.c
> +++ b/drivers/net/wireless/realtek/rtw89/pci.c
> @@ -470,9 +470,12 @@ static void rtw89_pci_tx_status(struct rtw89_dev *rt=
wdev,
>         info =3D IEEE80211_SKB_CB(skb);
>         ieee80211_tx_info_clear_status(info);
>=20
> -       if (info->flags & IEEE80211_TX_CTL_NO_ACK)
> +       info->flags &=3D ~(IEEE80211_TX_STAT_NOACK_TRANSMITTED |
> +                        IEEE80211_TX_STAT_ACK);

Why should we clear these two bits?

> +       if ((info->flags & IEEE80211_TX_CTL_NO_ACK) &&
> +           (tx_status =3D=3D RTW89_TX_DONE || tx_status =3D=3D RTW89_TX_=
RETRY_LIMIT)) {
>                 info->flags |=3D IEEE80211_TX_STAT_NOACK_TRANSMITTED;
> -       if (tx_status =3D=3D RTW89_TX_DONE) {
> +       } else if (tx_status =3D=3D RTW89_TX_DONE) {
>                 info->flags |=3D IEEE80211_TX_STAT_ACK;
>                 tx_ring->tx_acked++;
>         } else {
> --
> 2.53.0


pw-bot: cr


