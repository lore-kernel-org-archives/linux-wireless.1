Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794993276;
	b=0MHG2sdf/9TdGCKVoAb7RkwWENh8xKktX00ahswidPrqJnYmHYH14JNe36WRidl7Xvim
	 toSzD9LmNg/7cKqYIFeSZFsZUJl/xyG/7kuTJgbphGCiOTV56dkdcX02Nt62DDEqo+wMI
	 AAXy2nzV8EOcuZnBDsb7YELVRU97M0P2/BG3pNBYtF9dB2p1mWOUdN7EJRtK3EgMVwKsX
	 GuCWYh0xMl8wr39n6LMGcY8sxfJy2w/ds8AV311307aoiwJ5+1E6nnfZeyIptqpzshWbD
	 9V0BOL//Vc2nj86IhO+MZEUw5Odhv9fdvY2/BRBrRykWRLf8jlJ3NQ5kgf4mWQCu9BA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794993276;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=wpfKZ8NYHfJjBDEJIfAmHEAA+XABEcLHLhewUnnbptc=;
	b=38+5Fsm/xIjbe6G4+B0YEWwkGh7VmCR4+uAFXIXCfPhN1ZgxIZ9nI28qDHYEoOrLQq8Z
	 zWyeEfq2yJk0ielnkx3M1G0A5PZvFdIxlYZI5dsaUGQaQ5WG4zlojhhpuCARPo2z9bfUi
	 aGfSm2JKL7R2HRI/F+mV1e0UwQjOYkP+V9HxwnnycuenjAykgcTJrTwILj89LRZvDPFTI
	 8Ick9WfzkZq+zkSKVw4R7Uj1otY2bJejAgEkUHIEEM0xV5wee0V8aerELxcZpuow7e+o7
	 Eb3PqAYsYyZMsOafvSAFGO+fu5LILc7VqQ2jqBFqd6oatVEkIybmVCF4XkhqmNg4ieA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=atMBJ2nQ;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A701606A31C;
	Wed, 18 Nov 2026 09:14:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A701606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=atMBJ2nQ
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AI9EHaC41204479, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794993257; bh=wpfKZ8NYHfJjBDEJIfAmHEAA+XABEcLHLhewUnnbptc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=atMBJ2nQJ8BvwDsHKILWQPv267QNgtR6XMklgBHiB82YE/pYBEhSHaIy4/hqBu4lC
	 nKnJnKeVZkw1st/EHzh0ndZhXND8o0VrCoOwHyMPetxnW6vkEeDaHcb7B5wJ5w3z6n
	 G5cjMJJO3K929ESCzL5A5PQv+orUGdGsWKO6u8mDIaRpHZLZhM6GxMg7Osevewa5Ga
	 3nLmg96/LpduWNw7Cso7GyudJzIA7cLj4RQseMBGZpJsv4T8FmK6rKJvDp1snPLi0z
	 6PZPnLvN2beVNlAy+cbVilLiAmvZ6QJLj2jWGIoFC7ObphIAfWa6KNG3bxPqvTVdSE
	 jEnAZ4d230jBQ==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AI9EHaC41204479
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 18 Nov 2026 17:14:17 +0800
Received: from RTKEXHMBS01.realtek.com.tw (172.21.6.40) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 17:14:17 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS01.realtek.com.tw (172.21.6.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 17:14:17 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Wed, 18 Nov 2026 17:14:17 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Mehmet Fide <mehmet.fide@gmail.com>, Luka Gejak <luka.gejak@linux.dev>
CC: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"mehmet.fide@screeningeagle.com" <mehmet.fide@screeningeagle.com>
Subject: RE: [PATCH rtw-next v12 2/3] wifi: rtw88: support channel switch in
 AP mode
Thread-Topic: [PATCH rtw-next v12 2/3] wifi: rtw88: support channel switch in
 AP mode
Thread-Index: AQHddusUlFkb3JLAC0icESyq6ktwKbcy9ygAgAAD3QCAAJC3wA==
Date: Wed, 18 Nov 2026 09:14:17 +0000
Message-ID: <d55a09e0accd42f39f476d3abba1cdca@realtek.com>
References: <9BC4FC13-5723-4711-9798-11E3C285C7F1@linux.dev>
 <20261118083328.1984956-1-mehmet.fide@gmail.com>
In-Reply-To: <20261118083328.1984956-1-mehmet.fide@gmail.com>
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
> > I think the presence check is better fixed in
> > rtw_core_check_sta_active(). Its callback only reads interface state, s=
o
> > could it use an atomic interface iterator without allocating entries?
>=20
> Right, the callback does not sleep, so rtw_iterate_vifs_atomic() works
> there. The check is older than this series: since commit 96fbb84de4ff
> ("wifi: rtw88: handle station mode concurrent scan with AP mode") a
> failed allocation also makes rtw_clear_op_chan() drop the operating
> channel of an associated station, on BSS_CHANGED_BSSID and in
> rtw_ops_stop_ap().
>=20
> Ping-Ke, Luka: would you take that as a separate fix for rtw-next, or as
> a patch before this one in v13?

I think rtw_core_check_sta_active() is used under wiphy lock, we can
migrate to use for_each_active_interface() with lockdep_assert_wiphy()
as a separate patch.

