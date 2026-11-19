Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795072137;
	b=Pm2iVpYADSQLS7qJYX5Kb1Ne5T7pj5Y2NtfTHR1BXdtZk65KKWAwRGMXBV8Q8xp9B998
	 KifpxM4d3aPDF9mJjoczqOpIBCzxYcstcPZ7Wqfyo23zydhWveKDdWxwswR3OQwbhSMDj
	 4GuIpAtPtA7dKlOMuzQ5GQt+EonjGhWA4SULk0UpzQG/CzZspeo0szGnUuDSMvKt7Ve4D
	 Egs6weJDj1/lO997tazfwBRJPTAdbfTnaY5IAK2e4DQLEopO8LZjZspRZMUm8TmQTHMr5
	 zAGjbeasrrU73p3NKnr+atTSAUq2Dm6gTjDv886mSycgyFn7tPeXfApp6IJD1TTnSiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795072137;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=7dYtgH4kEmR3d4IuYlEckKeBEcOOrZ989ElCXLmPz98=;
	b=tUz6s6Qzk/0qJ9RhLXI30b1VZ8A8WD48cQ3OWVHvcWEUo/ywE0Xl4QUqshlfQzrVbvU0
	 mOxYNpYnDYLbSdgoghdIrknxuAEtnALc8m3uUtyR1QwITXePLOYJI/GQ3F1WeXUBRJ/UW
	 EE6SuDwioqfDN1VRUeYd+N6HdvcNlmKzCFyMfprddjhiHC3lgyhyf6zCCRwpegEF8g/V4
	 5A3SRLxp/XWG4FdoJ/+QIHCQqGZSMvLRSD/eBjaIt/ch/8pmFqu/lMpv/Rc1yaUOpm9kN
	 ye7JqZxg3ogGHuaqbEOvIW5TWeWohepRLnjzEBTrShp9qHBCb4AC5o7P0GKS68b6ZIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=SFPOGy4K;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB674606A325;
	Thu, 19 Nov 2026 07:08:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB674606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=SFPOGy4K
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AJ78nlB62099473, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795072129; bh=7dYtgH4kEmR3d4IuYlEckKeBEcOOrZ989ElCXLmPz98=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=SFPOGy4KAjIGN3tnM3/dDais0BpADMJFeVsY6ZISX+9Z8WRHEXJvSbkXPN0OweE/x
	 w0wSDa2jk1ckkxo6nMEpPBqsGzzhyIeEhNKGIfYXArKyVBtsGBu68491RyrNRgarik
	 j8wf050HmSKDFLqXCrDIzzppzi58UUiKuIBwa44Nbj0bQp2+3mfdKdmuKiC7tmR8uV
	 iLZpVPCsSRvsivZ8oTORHfu2K1GAqmgqP9pIOn/QSbl2CTBFAozN5yJ9odiaZ6akrv
	 heO26fA+lYEoSfb/Xsi34tr0PMlpEFS6c7r0hzgMaYoRUHTTq+8kKLmZHn5qajhmxh
	 8Gcaj732CtamQ==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AJ78nlB62099473
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 19 Nov 2026 15:08:49 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 15:08:49 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Thu, 19 Nov 2026 15:08:49 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Enver Ikromov <owner@ph4ntom-rev.uz>
CC: Zong-Zhe Yang <kevin_yang@realtek.com>, "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH rtw-next v7 1/5] wifi: rtw89: avoid NULL vif dereference
 in rtw89_ops_tx()
Thread-Topic: [PATCH rtw-next v7 1/5] wifi: rtw89: avoid NULL vif dereference
 in rtw89_ops_tx()
Thread-Index: AQHdd4eEd4tmRBmfmkeJ3lQsIu1eRLc0+bfg
Date: Thu, 19 Nov 2026 07:08:49 +0000
Message-ID: <d7e6871d86014de2a27f2d09dbb5b0fc@realtek.com>
References: <20261118180435.904-1-owner@ph4ntom-rev.uz>
 <20261118180435.904-2-owner@ph4ntom-rev.uz>
In-Reply-To: <20261118180435.904-2-owner@ph4ntom-rev.uz>
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
> Injecting a raw frame on a passive monitor interface while a station or
> AP interface is also up causes a kernel NULL pointer dereference,
> because mac80211 has no virtual monitor vif in concurrent mode and
> passes a NULL vif to the driver TX path.
>=20
> Check the vif pointer with vif_to_rtwvif_safe() and drop frames without
> a vif.
>=20
> Fixes: a0e97ae3f332 ("wifi: rtw89: add ieee80211::remain_on_channel ops")

I think this problem is existing from initial commit:

Fixes: e3ec7017f6a2 ("rtw89: add Realtek 802.11ax driver")

> Cc: stable@vger.kernel.org
> Signed-off-by: Enver Ikromov <owner@ph4ntom-rev.uz>

Otherwise, looks good to me:

Acked-by: Ping-Ke Shih <pkshih@realtek.com>



