Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795757933;
	b=kKF3Kx8P9J2VTSAJi6FneLLj0PdNrAlCVie/3rW/5r2YqaXF99lDC9cvT79Pdevj0o0c
	 XhS2S1gsjBJ3UBYnxEavtasWERkIKbnrocYfSCQW2j1nXRYppG2lHCWbDHFiCZ3yPUh6v
	 b5QwHIH8KbjALEFC25Ufe2Y7Zm+wzZ35QaqYX8but4cliMIsbUxFdfmE28vYk/yYMVAdL
	 VqAN6d1B0cx/7esl20/EJdrGOIqK2a7Y7xo+xSwZ+dj03ocHz4SWCMPw7VngipDnBFifp
	 80lzHZy61XrfQsKRx/UkcteB0w8nIDtU0Qtm81em+F1cdUnufPCDZVZrkj/0lA+oUzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795757933;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=W2H0uSRnjPu7WMPX1UzBqKbEhzzTOmy3VJmIVK96VG0=;
	b=r/FcXcSaNeG+GR3L1OQJTOD88ez1g9SakfJVVKd/1F79ulZ1uPneci57VBRMLwEV2YTG
	 AfATtLh0fB5TBVTK2PO7PSYY2bhoM8IhkpOBgah1JvfqV16aHh9g3eAp6Br9LjTP8Nl5J
	 Q9HG1Led2xUbhB5GCH4joLHDVwujDh9Rv9vgeF42ZcJCkxTmfAecEg/YqLd8YAr7Zj4M8
	 lnQI5HhOJqoslXGkmUwOc3ifduqM8hYyDusUstyfqHdpPPHYmEHUwtLeButkQU0uXuMua
	 o1VTNmrAha2F8UpCWTVID/SDv4DayM3YBijfAGYmMobF6EBzYOPKmq9JZqmMYl/e/uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=RIACzBis;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CBEA606A324;
	Fri, 27 Nov 2026 05:38:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CBEA606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=RIACzBis
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AR5cEoX5660473, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795757894; bh=W2H0uSRnjPu7WMPX1UzBqKbEhzzTOmy3VJmIVK96VG0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=RIACzBisfRdWVb+KK2TOwnsJpJ6zKFM0nSzv567QkSP+PcPTn69c4kZsIAIsHzCRX
	 5N/0MF3v+vUOhvS+NCBbyhCcFClrjkUeCiVMdXD4x2b4Urxzqp7XTFaQcCEurOVT9N
	 C6YdRMSD+Fz/i7v/v+jH6im85jNojCHhGtrSFsWTaksZoQYjoYgayANOmwTkrIzdKl
	 KNo6UK4RARJGOgKd4Xehf1bWTHOt8qcPH1fSi4Su8fPq2YAdZWAvdS0Ea4Vh0PWq2R
	 2EBaiRTPTkmMRM7qKxg3PpJbrQOkXNfvuWQHC1xi7g1fCxCfFbNn9gdv42wtA9KNdr
	 QIwGya8EZ0rNA==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AR5cEoX5660473
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 27 Nov 2026 13:38:14 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 27 Nov 2026 13:38:14 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 27 Nov 2026 13:38:14 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Fri, 27 Nov 2026 13:38:14 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Mehmet Fide <mehmet.fide@gmail.com>
CC: Luka Gejak <luka.gejak@linux.dev>, Sascha Hauer <s.hauer@pengutronix.de>,
	Zong-Zhe Yang <kevin_yang@realtek.com>, Tzu-En Huang <tehuang@realtek.com>,
	Yan-Hsuan Chuang <yhchuang@realtek.com>, Kalle Valo <kvalo@kernel.org>,
	Stanislaw Gruszka <sgruszka@redhat.com>, Brian Norris
	<briannorris@chromium.org>, "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "mehmet.fide@screeningeagle.com"
	<mehmet.fide@screeningeagle.com>
Subject: RE: [PATCH rtw-next v4 2/4] wifi: rtw88: report the frames purged
 from the TX report queue
Thread-Topic: [PATCH rtw-next v4 2/4] wifi: rtw88: report the frames purged
 from the TX report queue
Thread-Index: AQHdeeywPcQt9oNGjESq/X+q0rK+NrdBbwxg
Date: Fri, 27 Nov 2026 05:38:13 +0000
Message-ID: <9c857e4e269e40eb9c74a1e6d1d446c7@realtek.com>
References: <20261121191528.591334-1-mehmet.fide@gmail.com>
 <20261121191528.591334-3-mehmet.fide@gmail.com>
In-Reply-To: <20261121191528.591334-3-mehmet.fide@gmail.com>
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
> From: Mehmet Fide <mehmet.fide@screeningeagle.com>
>=20
> Frames waiting for a TX report of the firmware are freed with
> skb_queue_purge() when the report times out and in rtw_core_deinit().
> mac80211 gets no TX status for them, and the frames it keeps for the
> TX status of user space stay pending until ieee80211_free_hw() warns.
> On an RTL8822CE, after a firmware crash and an unbind:
>=20
> rtw88_8822ce 0000:01:00.0: failed to get tx report from firmware
> [...]
> Have pending ack frames!
> WARNING: net/mac80211/main.c:1761 at ieee80211_free_ack_frame+0x4c/0x70 [=
mac80211], CPU#1: sh/24725
> Call trace:
>  ieee80211_free_ack_frame+0x4c/0x70 [mac80211] (P)
>  idr_for_each+0x6c/0xf4
>  ieee80211_free_hw+0x30/0x8c [mac80211]
>  rtw_pci_remove+0xd8/0xf0 [rtw88_pci]
>=20
> Free them with ieee80211_purge_tx_queue() instead, which reports them
> as dropped. Clear the TX status of a frame when it is queued, as
> rtw_tx_report_handle() does, so that a purged frame does not report
> its leftover TX control data as status flags and link ID.
>=20
> Fixes: e3037485c68e ("rtw88: new Realtek 802.11ac driver")
> Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>

Acked-by: Ping-Ke Shih <pkshih@realtek.com>



