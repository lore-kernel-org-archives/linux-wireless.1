Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794532816;
	b=GnzEnLGhi2vE4mvop6V6wcz2RVPBi+Job3CAdBwClK9PjR78WZLCxmxLMdlnwFDcSSly
	 JBiPLZbeFSCqZ1HVKTqUvRhkB/sqy6favgU1DOPmUDAMnKK4z5w7VAB1tT8iKJ597wqLQ
	 yAK93U1WH2ZfBM75eM5nE0PKVzHGj+U+72jBBkx6BxwO7TaHSMfqynxSuS/Eqgi6xLwrx
	 autPGDiFEgWfy62Adjr2WtREVTteoljlgPVAKN8ck7Jsk90nTeS7iFVijt8PhWpAdtBQJ
	 4V9YB7w5dQRTVMj1kSCpsWnYlGZLGNz1z0OLiynmo8pyLFpyamIuneFXR7ZvsjDh0rQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794532816;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=Tj2askOjOjtiCyawkKnsjjki33RWSYUjunqpdIWxnB8=;
	b=4r60GHnDVMRkdHqnyhOdSNgzCoTF/1pcxrVjLT+EFdyXJhPqFB6J9Uk9oAtyLuKbcbaE
	 cieSd4huAln1Bh8tjthZxreqF5BodNFIR1Z41Kgcp7yqeBQnuinEXZOj/inTAfP/qVcYO
	 9BBy126tMnyt3VYXNe8XN3KMjYqSzx+ybW3q07qwGz1TkwH1jGBVpS1B+Nttw2tWRuNiJ
	 o5U8qEqosCVv3O1SnFWTjHRFzyoRnZbYHX1A1byCohTimLloUhccyDLej8ur7tM5fdM4Y
	 K3F11YLQTSX7sA/NUSQF2VLvk1zKY+3+Jf89Jh861ZAsmpbpq83+x6+ji8jKQDvCOyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=mZJemXJh;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97756606A321
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 01:20:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97756606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=mZJemXJh
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AD1K8L70219782, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794532808; bh=Tj2askOjOjtiCyawkKnsjjki33RWSYUjunqpdIWxnB8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=mZJemXJhxn4Ltp1LFvdu505JQo6OLl7/unYUbff3Xrj6oqtbGlz3DuK68an53Qvns
	 KmHQTFB5JAmDJ+m6NiX1VUHVkhsB6GjHUv1kTOH9kSO2t+wkuWDxNDsN3v65vGSHoZ
	 T4DYpkQsXUEmjcUU+OTTBUvtmHjW3bFV3vkzx55qj5/gCJI5qc8RRMnAOzZwSn9Oaa
	 GpcMY4cdU0BpeTR5E83rPOrhCdx/H8POMAJ3vLr6HNrRw/VLTDIs7xqKP8ZQSwtiyo
	 xrlUVTakbdhGwAPwN6SH+XNqFzLdp5WsB2Cm2acWDs9Y1eioTZSMJd/NHppLwigdD6
	 7qrCqaucrE3nA==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AD1K8L70219782
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 13 Nov 2026 09:20:08 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 13 Nov 2026 09:20:08 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Fri, 13 Nov 2026 09:20:08 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Vincent Schurink <spam@acio.nl>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Subject: RE: [PATCH rtw-next v2] wifi: rtw89: set RA init rate level from RSSI
 in RA update
Thread-Topic: [PATCH rtw-next v2] wifi: rtw89: set RA init rate level from
 RSSI in RA update
Thread-Index: AQHdcntnstd2/ewBy0q6uXNQdyKYX7crMN+Q
Date: Fri, 13 Nov 2026 01:20:08 +0000
Message-ID: <a913df5736a04e0eb0844ad4549ae241@realtek.com>
References: <20261112075622.32785-1-spam@acio.nl>
In-Reply-To: <20261112075622.32785-1-spam@acio.nl>
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

Vincent Schurink <spam@acio.nl> wrote:
> When a station associates to an AP, the AP does not know the RSSI of
> the station yet. Thus, rtw89_phy_ra_assoc() sends init_rate_lv 0 to the
> firmware. With this value, the firmware RA of RTL8922A uses 20 MHz and
> VHT-MCS 2 for the station. The firmware RA does not try a higher rate,
> also when the PER is 0. On an 80 MHz AP, the TCP throughput to the
> station stays at approximately 35 Mbit/s.

As rtw89_phy_ra_sta_update() does below periodically to update rate mask.

    ra_mask &=3D rtw89_phy_ra_mask_rssi(rtwdev, rssi, 0);

Could you try moving AP and station closer to see if this can improve?
(Please run over 1 minute to have enough time for the RA algorithm.)

>=20
> Move the mapping from RSSI to init_rate_lv to a function, and use it in
> the RA association and in the RA update. The firmware uses
> init_rate_lv only together with upd_all. Thus, the RA update also sets
> upd_all one time, when the level changes from 0 to a known level.

The upd_all will reset RA context, so only do this once if RSSI is unknown
during association like your v1.

[...]

> @@ -509,6 +523,7 @@ void rtw89_phy_ra_update_sta_link(struct rtw89_dev *r=
twdev,
>         struct rtw89_vif_link *rtwvif_link =3D rtwsta_link->rtwvif_link;
>         struct ieee80211_vif *vif =3D rtwvif_link_to_vif(rtwvif_link);
>         struct rtw89_ra_info *ra =3D &rtwsta_link->ra;
> +       u8 prev_lv =3D ra->init_rate_lv;
>         struct ieee80211_link_sta *link_sta;

reverse X'mas tree order.

>=20
>         rcu_read_lock();
> @@ -519,6 +534,9 @@ void rtw89_phy_ra_update_sta_link(struct rtw89_dev *r=
twdev,
>=20
>         rcu_read_unlock();
>=20
> +       ra->init_rate_lv =3D rtw89_phy_ra_get_init_rate_lv(rtwsta_link);
> +       if (!prev_lv && ra->init_rate_lv)
> +               ra->upd_all =3D 1;

As I mentioned above.

>         if (changed & IEEE80211_RC_SUPP_RATES_CHANGED)
>                 ra->upd_mask =3D 1;
>         if (changed & (IEEE80211_RC_BW_CHANGED | IEEE80211_RC_NSS_CHANGED=
))


