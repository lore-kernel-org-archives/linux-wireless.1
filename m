Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795065643;
	b=hH/lVVhrPuN96+h8DI7ZLPXRB5QcFWlr6wudSAJEMm1A+VwAJDNAKPsoSfCPNeQmjl0+
	 SunMItfiZgy1Cm3E1q334IULulch9z4oedhiMElU4y0GCjxSHlJQpbiv9jh78di0371tw
	 oK1tK8SIwZ7YsesfYp39LJYfTfwybQAnrWVpSYCPnn0NTgK8CY2OaknoavgrE+gQ4s7ox
	 ewoex5PXg/5irAnMd3ZZm+mjnYivT410/VTbHRySVkI44feiyasHRsXFR0SQTovW/rgG7
	 WC+dKHiKQFvfRdMRPjMJ77Vbm9hjycYcAB96d2ygCWOpSobC4UgMaViJp9MyIj273fQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795065643;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=y5AspP9F5DF4vDzgrUup8Ga18pW5PyOtfTkcq4pNT/Y=;
	b=ZFLTxGlZxfHnGgsvNEnlZVsFcrVUFmXWkXsqnqld2isVvT+3JlCjqkfCMEpG4HAi/BWN
	 UggAkq2/+LgOlSM660gebWKO+qXorMAeR95bQiiHu31ZbJgAabCI5oETlfwXOiyJNSu6h
	 GTqXoEmahTImWqEu1d2EzRSSaBfS/pByEv2ealNgOH7VQykR+K0e8DXdSEjCE9pbi0i9/
	 UmtwsmupoSQlNsP9JsSC5i7qa7fkCrRnKd2oBzj/yao11qv89ioztgSCXOrOWbfNanJqf
	 L0ngo83KeSAblhyQzeJW3N5LpY1bUFPM+bvJvYxYZz+FngnN+dluaV4O3IPqvrGCmEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=NwPf7x1X;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BFD606A320;
	Thu, 19 Nov 2026 05:20:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30BFD606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=NwPf7x1X
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AJ5KBjZ42036408, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795065611; bh=y5AspP9F5DF4vDzgrUup8Ga18pW5PyOtfTkcq4pNT/Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=NwPf7x1XhfCvNARbEhOuGTTRQ1NqMKQc5YRdtGsKmBfgnFMboOah2ztUKAHOVoKLy
	 Q0okHsaHrhWXgKm5QwGIGkxhuBBBdrCgnQX+IMM3vmqfvq1hzTrxszmPWjTCNxq96r
	 4zomB6zrpr8WxdtZ4YvU1EQMkrHhjbPVBUTmRYL5rW560uu2E+7sYvlyiTVFDny7IT
	 HM36wdEdvo1d9fFBmbmTPQmyuVBBp+vx47gO+EyPGg1oocSxCOUEM86M+T1HWBf3oB
	 YHFo4x4byEJCl9TKVZpUpAa8Zf31ndHdLQKAZUIOuh9Aw2VVFyuUjKKKxGBR/pTc5E
	 EvsbRCbOaFrCw==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AJ5KBjZ42036408
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 19 Nov 2026 13:20:11 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 13:20:11 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Thu, 19 Nov 2026 13:20:11 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Mehmet Fide <mehmet.fide@gmail.com>
CC: Luka Gejak <luka.gejak@linux.dev>, Bernie Huang <phhuang@realtek.com>,
	Kalle Valo <kvalo@kernel.org>, "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "mehmet.fide@screeningeagle.com"
	<mehmet.fide@screeningeagle.com>
Subject: RE: [PATCH rtw-next] wifi: rtw88: find an associated station without
 allocating
Thread-Topic: [PATCH rtw-next] wifi: rtw88: find an associated station without
 allocating
Thread-Index: AQHdd0o+bjStWKX/JkO3+8ER2gvmqbc0sbJw
Date: Thu, 19 Nov 2026 05:20:10 +0000
Message-ID: <50ac2a659ca340dda44d63b02ffafac1@realtek.com>
References: <20261118104738.2020747-1-mehmet.fide@gmail.com>
In-Reply-To: <20261118104738.2020747-1-mehmet.fide@gmail.com>
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
> rtw_core_check_sta_active() collects the interfaces with
> rtw_iterate_vifs(), which allocates an entry per interface with
> GFP_ATOMIC and skips the interface when that fails. A station skipped
> this way counts as not active: on BSS_CHANGED_BSSID and in
> rtw_ops_stop_ap() rtw_clear_op_chan() then drops the operating channel
> saved for it, and a later hardware scan no longer goes back to that
> channel between the channels it scans.
>=20
> Both callers hold the wiphy mutex. Walk the active interfaces with
> for_each_active_interface(), which does not allocate.
>=20
> Fixes: 96fbb84de4ff ("wifi: rtw88: handle station mode concurrent scan wi=
th AP mode")

I'd remove this Fixes, as my comment in Closes link.

> Reported-by: Luka Gejak <luka.gejak@linux.dev>
> Closes: https://lore.kernel.org/linux-wireless/9BC4FC13-5723-4711-9798-11=
E3C285C7F1@linux.dev/
> Suggested-by: Ping-Ke Shih <pkshih@realtek.com>
> Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>

Acked-by: Ping-Ke Shih <pkshih@realtek.com>


