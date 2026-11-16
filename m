Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794818039;
	b=VN9UW8BmTPpkElgWfB4JqdCisndVzpIxaOJR3lDop4fx05rWoJnbzXAASbWcHadVDJlI
	 sif+5UdCqHejBr/kg6AP252U7gspVw7SM6YuLDwSRsu67+MgbYjHdqQb36cS5rfg1UUuq
	 m6fSDEf6eDwIFkkZwsjaQLyKnX5fzy5b+HpPfrVexMSDEo7CRw4AyEsaEf44KOh3eJ51d
	 wFMyPBI0r2JL6GY3B6t83EtPe9wFUKKftoEG/+RcFY8+7U0HjA96llfpmmepnkQ7HCtUu
	 Dwg6OPg4K8aWMdE+FUiUv5I6CdYAz5BK4e2ICtTyTcp75h/sXepUYE5lh5nLFRWTyDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794818039;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=Wq/fgh+YWqcIiWb+gEneCi6/SsCiLafPAH9zRCY2V2k=;
	b=FaKE3J6pYFSI9R1ZgoLleX2Jtz4VXpzmkLElhMf+aODu7rYECxUlmpzc9fHdb7vjAWB0
	 FAkY4S/6gPOxx1oOSA9gHQgm2t/hvXZcDPTBBMhsfda8QlFuSRHibqURQvr1X9cVZGaww
	 jPXm72ix+J42eOIQrZwcODbfqLpErPm2o5BR+Oteo3NceggCc7prF3uRLaHA+aosRJJJa
	 1pTMABk39qc4fBm8RM3YBBI8UZjjp3b364Gex/k6Co8xUT2BugGgCrcQChsV+I5FbyGC4
	 WUOOmc0X9NIvQQk7d3UaaQMuwMe8qW725IK00nGvuMcqQ1RN5oKmNt1bq7WckIVjJCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=WCnimIvh;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81FF606A329
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 08:33:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E81FF606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=WCnimIvh
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AG8XsY323256154, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794818034; bh=Wq/fgh+YWqcIiWb+gEneCi6/SsCiLafPAH9zRCY2V2k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=WCnimIvh7maENuBAXvwIyjSmomlg9Kj0gSZK0vJR6833yBI91qaI26k2MG5rd86DF
	 Aae4WR+0j4P8soSM5TgcGgDTLi6WjGkKy/S8nMkXX0dODr1myS/FTm6FjKQ/lfXCob
	 pBVzHY2v+G6i0I2ZkqeTFwvenU2vle9KiVgDVk/bhaPgySUuOQ7SJezyXXJmSDziqK
	 Zr2DZZ6MOc+rA+JTh3kG5boBOuvUk5W6WO3O7qbsHeXW79Ld2r/ZoPqiIXJFsQ5kIx
	 DeASCVO2MNFMEh/cbG9fv1v/YfEBGdAndt2QwpgK8YD4YWC9/o4Ou1oF1rfwtI0NYS
	 D8WxVuPrGyY/A==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AG8XsY323256154
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 16 Nov 2026 16:33:54 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 16:33:49 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Mon, 16 Nov 2026 16:33:49 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Vincent Schurink <spam@acio.nl>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Subject: RE: [PATCH rtw-next v4] wifi: rtw89: set RA init rate level when the
 station RSSI is known
Thread-Topic: [PATCH rtw-next v4] wifi: rtw89: set RA init rate level when the
 station RSSI is known
Thread-Index: AQHddaMS++ZuYtqjZUKpVYcocGcLmbcwXirg
Date: Mon, 16 Nov 2026 08:33:49 +0000
Message-ID: <affec3fd16f6419d8072f5dfba3b31ba@realtek.com>
References: <20261116081741.51039-1-spam@acio.nl>
In-Reply-To: <20261116081741.51039-1-spam@acio.nl>
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
> @@ -519,6 +533,11 @@ void rtw89_phy_ra_update_sta_link(struct rtw89_dev *=
rtwdev,
>=20
>         rcu_read_unlock();
>=20
> +       ra->init_rate_lv =3D rtw89_phy_ra_get_init_rate_lv(rtwsta_link);
> +       if (ra->rssi_unknown && ra->init_rate_lv) {
> +               ra->upd_all =3D 1;
> +               ra->rssi_unknown =3D false;
> +       }

To be more conservative, I'd only update ra->init_rate_lv when ra->rssi_unk=
nown
flagged, since I don't thoroughly know how firmware deal with the value.

Let's get and check local variable, and then assign to ra->init_rate_lv.

>         if (changed & IEEE80211_RC_SUPP_RATES_CHANGED)
>                 ra->upd_mask =3D 1;
>         if (changed & (IEEE80211_RC_BW_CHANGED | IEEE80211_RC_NSS_CHANGED=
))



