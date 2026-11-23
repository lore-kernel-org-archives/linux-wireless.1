Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795412853;
	b=qIa3OqHSUP47DcnQdoGhs3yWtDdx9c2WK0U2DutmSwODWRetUwNjXFCYGmobsaqcOqzs
	 Y1aDr22mZoY5eFdI9SeXnRSRjvThi7+Ges9pE167Q0YEXhkXy0eDdk6Bzp9iStKdpP17U
	 IfbwTSnUjNJeK924lqTyxqZE1nk541L6ovLZIziwLIAGt545FPgjPQS8H67Gb8KBmfvNe
	 PBbHd+FHavzKxMgCakZDNQDFhcele+/U401jHi3bDS7wDufsu6veSQaL2qj5VADQcXBbJ
	 MQQ/Q7DzjeKgU/OHmS4AMKRLnT7zLnfIkI6dWwbGNvIADAbMcpBaqOn9dXBCSfR13/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795412853;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=QJyDuF9x5XygCnZc5MrDIe11Be8yWzxE6mo96qUTdOg=;
	b=Jfe8cunA0jjfbiwGtpWdES4RQBr0tDoruijaYHaLe9NUS72WqGrUYLpArpfCtVduobvf
	 +MEwnzWr/1eIDXreFbdVbK22+ssdqrzqgKDZYg2gIi8Ah5S0gjWZNBjLFRdpwmLpd/uY2
	 YFyDwNE2hrDymtrHSetR3JToXaxiJkC+0Wm+9GmmigxcHgFKY/Idv1gajpMIEPyxlNohw
	 6lawK++j4qqrZsx9oa702Ktq4A+761B5NhK2P6Fo1bEDK55rGSYovUyhX5JFaxmGCSYEr
	 nOQqLdCcabXqTemIb+bKQyjMMFvSgd1hJPIwXtpEGt3tjHvQLP+A9mQcJ0eTmBBJAiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=sK7h9EUA;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F850606A31A;
	Mon, 23 Nov 2026 05:47:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F850606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=sK7h9EUA
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AN5lRUj91396544, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795412847; bh=QJyDuF9x5XygCnZc5MrDIe11Be8yWzxE6mo96qUTdOg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=sK7h9EUA+XD60b33HXKcQspHlmByr43hYRlNjh7TEMlosqfom6p9Gcf2oSiMAadXi
	 LYJGTVAILNkM3075rH+VMTKAqLwE5foWk7BzdXK3ALlmqaaQTmkJ5JUTYaroI5rnRo
	 vX9n1/6sIZmPxFMsuhHCDDDQWeFZctUJXZtTqwhHFkkwO/5bWfesQgOJ8cLpVX+hZs
	 rZ6D265YaGQhvLOsWiFsiYgo53PkFd91/9p8ko4hfIvINqCW3fFplD41o2Cmg2Sj5F
	 7UjyXobQXY/cGTEpLGqY3BKOoQyM8drBeoOcN0bLX8qAjRB7CZIe3fNf8aeZCFldWu
	 ueQ/MBsrDA81Q==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AN5lRUj91396544
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 23 Nov 2026 13:47:27 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 13:47:28 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Mon, 23 Nov 2026 13:47:28 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Zhao Li <enderaoelyther@gmail.com>
CC: Hemanth Selam <hemanth.selam@gmail.com>, Morning Star
	<alexbestoso@gmail.com>, "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH rtw-next 0/3] wifi: rtlwifi: don't mark unencrypted frames
 as decrypted
Thread-Topic: [PATCH rtw-next 0/3] wifi: rtlwifi: don't mark unencrypted
 frames as decrypted
Thread-Index: AQHdedZu2JzQKMh4KkC+whaoNAXXp7c7JGHQgAADwoA=
Date: Mon, 23 Nov 2026 05:47:27 +0000
Message-ID: <f42a652dc4f64f72a5026bf709be74b3@realtek.com>
References: <20261121163547.37019-1-enderaoelyther@gmail.com>
 <9125d3868f9e463f8639f3449cc7db2e@realtek.com>
In-Reply-To: <9125d3868f9e463f8639f3449cc7db2e@realtek.com>
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

Ping-Ke Shih <pkshih@realtek.com> wrote:
> Zhao Li <enderaoelyther@gmail.com> wrote:
> > rtl8192d (rtl8192de/rtl8192du) is intentionally left untouched here:
> > it checks the cipher reported in the RX descriptor, so unencrypted
> > frames are not marked as decrypted. However, when a cipher is reported
> > and SWDEC is clear, it still sets RX_FLAG_DECRYPTED for protected
> > robust management frames. Ping-Ke, does RTL8192D decrypt those in
> > hardware (or set SWDEC / report no cipher for them), or does it need a
> > robust management frame exclusion too?
>=20
> Per rtl92d_rx_query_desc()
>=20
> 	stats->decrypted =3D !get_rx_desc_swdec(pdesc) &&
> 			   get_rx_desc_enc_type(pdesc) !=3D RX_DESC_ENC_NONE;
> 	if (stats->decrypted)
> 		rx_status->flag |=3D RX_FLAG_DECRYPTED;
>=20
> I remember this chip doesn't support PMF. For PMF packets, sw desc should=
 be 0,
> and enc type should be NONE. So original logic should handle this properl=
y.
>=20

Looking into patch 1/3, I'm not sure the sw dec part:

	/* hw will set stats->decrypted true, if it finds the
	 * frame is open data frame or mgmt frame.
	 * So hw will not decryption robust management frame
	 * for IEEE80211w but still set status->decrypted
	 * true, so here we should set it back to undecrypted
	 * for IEEE80211w frame, and mac80211 sw will help
	 * to decrypt it
	 */

I think a real hardware is needed to check the status.=20


