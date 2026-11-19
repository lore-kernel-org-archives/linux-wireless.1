Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795072480;
	b=teBQvpP32CwxIfwwk6K32lsyg/8WgleZzwsOWkWePDE6HgkIQyQP25VOQ2LYlvA1Of5l
	 o6U2QLJ+pE+Z816koGWYJ3id8R2IfTV4o+y9XaHcy1mEDXCYwfudfM4FFzzO5LmqSCpSh
	 4e3TApAaocOPwaXNDlFpTtyqHQqD4XQOU0fYp/3W9HBjyAbRBJ28Nwrzqlkb2xO74P2Qs
	 czVwmQB9ZixigoAtYTNHisR1E8i033gPmJVL4mJPSUCLhw8A1y4B/7baE0nBObOVxJKfJ
	 VD7GZjnhM5hwx0+zIBMRQyZbA6vF3BBzTuMa5Li1IxQw88HdyO5ilU/eknWmejekLlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795072480;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=hGGd1IF+R9uV56fbabLJl+hbln1i7nYBUSJD0oTuskY=;
	b=AyF9FWN8Vaw4/Z/HjxjoIvWiKizL6swT0b3NB8TFyffTOR5Cxvx+3RKvv7YZWqTLiata
	 RpdHaA1q5nZUICH3seAu487/8e9H5bTpjO1Yges395nb+/gdpfnDcAXl1YdxLsA2e9ben
	 fn6Lu0nyNntiywWkKLWu7DWkziFVJCyBzLHaESigh418QHdv+VmWiDIzLAo2kI431ltwz
	 U65U5rTSEYZn8FXo43eWqOhwW/o1QSkHLB9ekW6HRABVLCmfx1HNtl+r+7pojvmEt+w02
	 +1klbpClG8FPe/5Ej/gB+2xHQvAcgSZaLZXEqr/19BvAF1WGsxeEGngdaDfYRe5IjTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=J1SEtdff;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA42606A320;
	Thu, 19 Nov 2026 07:14:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FA42606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=J1SEtdff
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AJ7EXmlC2101863, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795072473; bh=hGGd1IF+R9uV56fbabLJl+hbln1i7nYBUSJD0oTuskY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=J1SEtdffrG+dGZ/0ajChfwFWSGmWfhqd8keGB8pPizO76jB2Ug3tzQpy4T1XThphg
	 ihfFVPjGjjqirr+zRvS85Mk0+qGgkIL3KKVzOp3LHW/MeRT4P+FgC6T4SWSe0z//oL
	 ybryAjL2k/hda5DazFTyMudZDerutIORnU1CeQXJDFqhqPeNQlnc6HZyVCuCi9u69m
	 cxAHoYKHALK6QFu8rw22JyVnP6AJZdiXSEGI7dMD2/Eaq2LuoE473vMrgzEPAcGhPA
	 LBzhnZ9v4aAbEAZqFsrmidMj6hXDF55uShgM8YoBwXUP7ysbZFsGEOAtvVnJ8rJWm7
	 VQ5DT+DkiJ0Jg==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AJ7EXmlC2101863
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 19 Nov 2026 15:14:33 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 15:14:34 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 15:14:33 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Thu, 19 Nov 2026 15:14:33 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Zong-Zhe Yang <kevin_yang@realtek.com>, Enver Ikromov
	<owner@ph4ntom-rev.uz>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH rtw-next v7 3/5] wifi: rtw89: restore channel when leaving
 idle on non-chanctx devices
Thread-Topic: [PATCH rtw-next v7 3/5] wifi: rtw89: restore channel when
 leaving idle on non-chanctx devices
Thread-Index: AQHdd4eur2dGd01tHEaSwSmN3bCfzrc0VFgAgACnewA=
Date: Thu, 19 Nov 2026 07:14:33 +0000
Message-ID: <87052ee887fb40b8a4ab83102e2384dc@realtek.com>
References: <20261118180435.904-1-owner@ph4ntom-rev.uz>
 <20261118180435.904-4-owner@ph4ntom-rev.uz>
 <61ca0408d2ba4b0f8232881a5729990f@realtek.com>
In-Reply-To: <61ca0408d2ba4b0f8232881a5729990f@realtek.com>
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


Zong-Zhe Yang <kevin_yang@realtek.com> wrote:
> Enver Ikromov <owner@ph4ntom-rev.uz> wrote:
> >
> > Fix the operating channel not being restored after bringing a monitor
> > interface down and back up on devices that do not use native chanctx
> > callbacks (such as RTL8852AE when firmware lacks beacon filtering).
> >
> > Stopping the interface powers down the PHY while mac80211 retains the
> > previous chandef and omits IEEE80211_CONF_CHANGE_CHANNEL on restart.
> > Record support_chanctx in rtwdev and set
> > IEEE80211_CONF_CHANGE_CHANNEL
> > when re-entering monitor mode from idle on non-chanctx devices so the
> > channel is applied again.
> >
> > Signed-off-by: Enver Ikromov <owner@ph4ntom-rev.uz>

Acked-by: Ping-Ke Shih <pkshih@realtek.com>

[...]

> Looks good to me

Will add your reviewed-by:

Reviewed-by: Zong-Zhe Yang <kevin_yang@realtek.com>


