Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795761263;
	b=QJLuHNPu3vskC7iTeEKAccMlZMbZARTu2RscBkEA3BdGWY9DnLHbC0a5HIFJKg4rUoXH
	 tWa+QD9z2zAWChJ0xXK7IUMXjPaQvekZhxkedKIRk8gqiqu81wJOsTLPEKPEtNh76mGpw
	 2hNH2S5E+j79BP39fEeZcdZcaAziwiZoBRQvKFCos5Y66wftF/AHs0fVZFUqblsbroAzb
	 vifNleEHPLl0YS/DQvQS2hX8YQH82b5rGALRkxehSKXWWlOqlJJlwTa7tU2/I9v5f7luj
	 hHKEALHyQRUA7XYu8IcNtYKXoJH/IP/DjNzjXZevHEuwLsc38218/UCa+R56KWSxSzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795761263;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=rV3gQSg8yWtUTbkeClCYOZ6dqPj5GbQM6Gt6Wx/d81M=;
	b=CErm4U2yAOLeWRRT0B1o/JveKPSj1giXIhjki0LdPv981La6eS5uLT+sGQQ8OD4/XeZS
	 SR6iWydJ30iFpM/BnQbIBpVZ5jEsZ58BBt6Tp0/kN/dHK97dcTWf9DlBehgiYSOE408+x
	 k9oVZ7FfyLBj47bmSZMaVXSIaCGZpNlhyfOnvhNjfsi3r6hlwrnSIxZpmmOehNPynnGko
	 6BcXiqP2btautX8/1YfjwDtGYvuvowrN1U5XcuFwo3yI0Ea7qB4PoURKFxSypCFT26Qb6
	 kOWMQx9CED83XdGPHLfj5XpiW49+SHJCfAXhWVv+ApQ35FXpq2/kVdkEXREKyOiHZcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=QbSdiaMI;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7C6606A31C;
	Fri, 27 Nov 2026 06:34:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD7C6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=QbSdiaMI
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AR6Y1foC734771, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795761241; bh=rV3gQSg8yWtUTbkeClCYOZ6dqPj5GbQM6Gt6Wx/d81M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=QbSdiaMIebIZ7fsX8O6PbQS4O07BnAa8/axwflmeqP0evMKctt0TgD+Bn50HdTTSg
	 4esURJs9jSPP5cKm0q4LbJy5lCk0lHFCCLBX37PKeKEB/DHpSLcEKq8sI+vXfDcrfZ
	 yjMhB8dDmLMiOrVekDoAaE6e2vUGwoOPEItX+nA109lRddlUZX9PErLwmS3fepwdPt
	 PK3U5o6g7LGm2Y7dMqKZDNvUVqw8xCPZtntb4LJo8XJE+2YzIQGRypCRW0GzjTO3rB
	 UZ7USDGUWwErO+yxMQGH8UnkyNlTEwFubYUjEem41+DJyNsyAQt4xsQZoUQpUVBf3n
	 7FXQhIf4+IwCQ==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AR6Y1foC734771
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 27 Nov 2026 14:34:01 +0800
Received: from RTKEXHMBS01.realtek.com.tw (172.21.6.40) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 27 Nov 2026 14:34:02 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS01.realtek.com.tw (172.21.6.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 27 Nov 2026 14:34:02 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Fri, 27 Nov 2026 14:34:02 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Mehmet Fide <mehmet.fide@gmail.com>
CC: Luka Gejak <luka.gejak@linux.dev>, Bitterblue Smith
	<rtl8821cerfe2@gmail.com>, "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "mehmet.fide@screeningeagle.com"
	<mehmet.fide@screeningeagle.com>
Subject: RE: [PATCH rtw-next v14 3/3] wifi: rtw88: time the countdown
 downloads from the TBTT
Thread-Topic: [PATCH rtw-next v14 3/3] wifi: rtw88: time the countdown
 downloads from the TBTT
Thread-Index: AQHdee+qTezIyBv8dUSLB0F4t45DM7dBfmPw
Date: Fri, 27 Nov 2026 06:34:01 +0000
Message-ID: <eb1f2c3f74e149d6870b759bf0246a2f@realtek.com>
References: <20261121193644.603289-1-mehmet.fide@gmail.com>
 <20261121193644.603289-4-mehmet.fide@gmail.com>
In-Reply-To: <20261121193644.603289-4-mehmet.fide@gmail.com>
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
> The countdown steps run one beacon interval apart with no relation to
> the TBTT, and a download close to a TBTT keeps beacons off the air. On
> an RTL8821CU and an RTL8822CU a TBTT during the download sent no beacon
> or the old one. On an RTL8822CE a TBTT up to about 100 us before the
> download also kept the next beacon out, so with a count of 2 no CSA
> beacon went out.
>=20
> Read the TSF and queue each step min(10 ms, interval / 4), but at least
> 5 ms, after the first TBTT that is at least min(10 ms, interval / 4)
> away. A step that runs less than 5 ms after a TBTT, or less than that
> margin before one, waits until after the TBTT. The first count is now
> downloaded by the work too, not when mac80211 changes the beacon, so
> the first CSA beacon carries the count after the first step, as with
> drivers that fetch every beacon with ieee80211_beacon_get(). The replay
> after a hardware restart still downloads at once.
>=20
> A late download delays the switch by a beacon interval instead of
> taking a count off the air; stations that took the switch time from an
> earlier count then switch up to that interval before the AP. At short
> intervals a USB download, 6 to 17 ms, can run past the next TBTT, and
> the USB chips then send a count more than once.
>=20
> The USB chips raise no TBTT interrupt, hence the TSF read. The beaconing
> interface is always on port 0: rtw_core_port_switch() moves an AP
> there, and an IBSS runs alone.
>=20
> Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>

Acked-by: Ping-Ke Shih <pkshih@realtek.com>


