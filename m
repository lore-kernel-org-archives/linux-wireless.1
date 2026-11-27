Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795758818;
	b=T8qufvptRTiLEF7ikXqgtTkkMZLdP7h8mgnQoC19NfD3sdhYZpOqgqnhfOM7m2Xle7gh
	 KyY5LBIPOXPFA1jr6NpdgWMcHn38Ul4rS4TUvP885YbXE3H6elcgUAnLK4AW62PmLCv2g
	 IifaW52Qn7FkKeF0hY46pvdxAxVwzEcAlrsjSSToHppAv5eEM7Z/PC6sAv/5EQM5zvZkM
	 uunzNq+AvrwZkKPwockiEN4Ba9nM9O0URS7RL8prYvogAyZATIU7glYXopMydFhSynTnh
	 Vcl6OmdNVSn1T/sglb6SBr8AcoV0SunrrV2m80Kq3u9tijSsyx0l1fIBbEWdDve+Rxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795758818;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=oAktRDKOLkezZ4GUDo2uU8tuJUM+6FFSXi/F1SA0IVg=;
	b=djkAjxINptPoywPIH7SMb2PKzb+jmxgOzVICtD21tSA86LKKgmTb2y16MZJ8vI84kH4w
	 lHc6tNvR0kAA/kqTHGhC9fFOLoBQdaLhvXpvCBMlZjzoHMNIwpVPxK1xs82yxxzBXXAbn
	 AHC5AvvG3+aP4ByzRs3S1vx0zhGZxYgteoydxNpodL7aRnbBvw0OcC4BqLAgD9eg3eRgI
	 Am89wI04V4xKBWgowXDbhnkrOf+prkgAZkYhg9xi5BHnF5MJrbuy1diWPWXnuP7See9A0
	 861py4dWNbRDxVnpcKb/XvMqw3h3B/TcSt+lqq4y0YizzFaYVuk3D3kCMjIghV8NNgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=NzS+W7nQ;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F9F606A32E;
	Fri, 27 Nov 2026 05:53:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8F9F606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=NzS+W7nQ
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AR5r44i9684566, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795758784; bh=oAktRDKOLkezZ4GUDo2uU8tuJUM+6FFSXi/F1SA0IVg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=NzS+W7nQ3emQy3QTZeHl2lUCK6d8KBDGMkCaVBhJ+VlNc9lv/4fRuK6HByWKBUlQw
	 UI8JqA+TQor31DFSryN2neOkKfBsUEjZrufPoCSf+oplI16P2XUSv2+P+cwL05MAkN
	 5TOYd38Xx6q7s4QjPJWAgqQ8Z/yRhr+qHvFEXEO5eIvyqWcu5mVeZQSHm1odiNXIsA
	 KbmKOWiTOylmhDdtz3jb7Zw2I7UHOAhtiNf89QNS3wyULMV7ZV2tjZ3O9/kFlchg8C
	 +CWcBAIPyaeZS1IPwo0HlWGcgS2PJx0GqAqTNrUveSlt+VF/Q6uzsl+jiDpM/ExRFY
	 vkZMY3Whf9fcg==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AR5r44i9684566
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 27 Nov 2026 13:53:04 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 27 Nov 2026 13:53:05 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 27 Nov 2026 13:53:04 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Fri, 27 Nov 2026 13:53:04 +0800
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
Subject: RE: [PATCH rtw-next v4 4/4] wifi: rtw88: reset the stations outside
 of RCU on firmware recovery
Thread-Topic: [PATCH rtw-next v4 4/4] wifi: rtw88: reset the stations outside
 of RCU on firmware recovery
Thread-Index: AQHdeeyxlgDItOdINkeOc5Q3W2ED47dBcv2A
Date: Fri, 27 Nov 2026 05:53:04 +0000
Message-ID: <948fc37394234af580787acbb1686ee0@realtek.com>
References: <20261121191528.591334-1-mehmet.fide@gmail.com>
 <20261121191528.591334-5-mehmet.fide@gmail.com>
In-Reply-To: <20261121191528.591334-5-mehmet.fide@gmail.com>
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
> The recovery after a firmware crash removes the driver state of every
> station with rtw_sta_remove(), called from an atomic station iterator.
> rtw_sta_remove() cancels the rate work of the station with
> cancel_work_sync(), which can sleep. With a station associated:
>=20
> BUG: sleeping function called from invalid context at kernel/workqueue.c:=
4722
> in_atomic(): 0, irqs_disabled(): 0, non_block: 0, pid: 14, name: kworker/=
u16:1
> RCU nest depth: 1, expected: 0
> Workqueue: phy35 rtw_fw_recovery_work [rtw88_core]
> Call trace:
>  __might_resched+0x13c/0x1f0
>  __might_sleep+0x48/0x7c
>  __cancel_work_sync+0xa8/0xb4
>  cancel_work_sync+0x14/0x20
>  rtw_sta_remove+0x34/0x10c [rtw88_core]
>  rtw_reset_sta_iter+0x20/0x48 [rtw88_core]
>  ieee80211_iterate_stations_atomic+0x80/0x144 [mac80211]
>  rtw_fw_recovery_work+0x1dc/0x2b8 [rtw88_core]
>=20
> Use rtw_iterate_stas(), which collects the stations under RCU and calls
> the iterator after it. The recovery holds the driver mutex it asks for.
>=20
> Fixes: bcafcb959a57 ("wifi: rtw88: use work to update rate to avoid RCU w=
arning")

Why did you choose this commit as Fixes? Does it should be

5c831644e1f4 ("rtw88: handle and recover when firmware crash")

> Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
> Reviewed-by: Luka Gejak <luka.gejak@linux.dev>

Otherwise,

Acked-by: Ping-Ke Shih <pkshih@realtek.com>



