Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795741894;
	b=PkOqeYmwuxsP8zKigMltiA/lyEgIGnqwVI/aSAuL6eng9xOaQyRjpSXBmut3VI0S1XPp
	 UqN28p6d/+9FgZp6iAF4V4Q3Sl6/nDqx4CuO+gHL0d3ZH0q1hEjcT1L2/+t8qEC28+TLW
	 gsh8n/TQ19U1Lfu3JXEKbC03EZRn6Dv4Ss9sol+FihLV8cT2p4MFI84sb6mmpagSOMJm/
	 C+48s6mCKYhx8f0aAgGEkZv4BXypx+O7nimTeNq7NLr100rRih9Rezk7kpWjJrpTgtGe/
	 4muvEpVDOZkS7hvyVS3qesUqVkqnLqCwDDhsTYBC02jXbSJYLXU65bkThoPhut6t3Uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795741894;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=ThVQwA5jrSgD3ienenNzY71N6Tdv2+kT18Z1r9JjCkk=;
	b=X7k8Mbu3RHO2Y9LZTc07R0jAvlrY31pO0Vck1Rkn/M5rVGs07G7hYiEfJAs3H6FyXciC
	 RpSWLiNd1g0oHhmLVUO8UVlYjrGcfmptOSWrDzQXm3ItvURgtv2SMRxjS3TPsjMOuE5fO
	 zSZ8BimOZ0PvyWtCnaAuR4YrRu5PQUqwMf1Jyc5yN/reaiSsq9Trx3hRmvfBpKzndzbtn
	 Kgpl4S/5iuHbYUhiZ9U8M94yIRK0khAFfQqD2ztGJappbNnWxUAelIuGZS4hAPkKqAd7/
	 TY8Z+gRsHtiJi9v5IsDltN/dQHpx+cqV41AC3jfQ+JyUCI7wZZlQ9MV4eCza5oMsqrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=ezDSEE9O;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6DA606A31E
	for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 01:11:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA6DA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=ezDSEE9O
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AR1BDpZ4528068, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795741873; bh=ThVQwA5jrSgD3ienenNzY71N6Tdv2+kT18Z1r9JjCkk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=ezDSEE9O2iHm9Y8yakPA7EcE8lZ7/E32D0Vndnb+8g23VtnXS7JK7ejCPUcDt4Rzi
	 NuXJRlgSGHi7PzCkd9zvwOwVDZi8BQC2H7dOCzKOl3o4sVYt6fYAsEINjOf+DXO6Qw
	 I6xUk4UPR6mLTLc3VlWyLRnnZi7hGbZ+adLZVxqHTeCyrXCN+wPUihyqfZFK2vTFpb
	 loirFnyhI1JD7Z0UFdYYbesBXcGFcXiGvbXOc7eP4M89ABA9p0xSeOxgzxyLYruz0d
	 8/GT0vViiA5ps5oQXQe7mtwBXJMPPEvmPXW1ui//tGY3O5kYE5+w4Kxcqm5O1c5d9/
	 OsMD2e3Q3cMPA==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AR1BDpZ4528068
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 27 Nov 2026 09:11:13 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 27 Nov 2026 09:11:14 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 27 Nov 2026 09:11:13 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Fri, 27 Nov 2026 09:11:13 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Mehmet Fide <mehmet.fide@gmail.com>, Shreyansh Khajanchi <hi@shreyan.sh>
CC: Jes Sorensen <Jes.Sorensen@gmail.com>, =?iso-8859-1?Q?Georg_M=FCller?=
	<georgmueller@gmx.net>, Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"mehmet.fide@screeningeagle.com" <mehmet.fide@screeningeagle.com>
Subject: RE: [PATCH] wifi: rtl8xxxu: Enable AP mode for RTL8188EU
Thread-Topic: [PATCH] wifi: rtl8xxxu: Enable AP mode for RTL8188EU
Thread-Index: AQHdaEhpWqRVzw+aqkmzkIP8D0CnC7cYm7VAgCbZtACAAcr9kIAABvrA
Date: Fri, 27 Nov 2026 01:11:13 +0000
Message-ID: <f8385f6638854ee58f9c7204208be49b@realtek.com>
References: <81c3d0056a0849078715e0f0be074d1e@realtek.com>
 <20261126052152.2887192-1-mehmet.fide@gmail.com>
 <79b1bbbf24614176b569469961c2d610@realtek.com>
In-Reply-To: <79b1bbbf24614176b569469961c2d610@realtek.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
Content-Type: text/plain; charset="iso-8859-1"
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

Hi Mehmet,

Ping-Ke Shih <pkshih@realtek.com> wrote:
> Mehmet Fide <mehmet.fide@gmail.com> wrote:
> > What works:
> > - Association and traffic, open and WPA2.
> > - Unicast TIM: the client's AID is set while mac80211 has frames
> >   buffered for it.
>=20
> Do you think it is acceptable for normal use with these functions only?
> For me, it is fine to merge this patch, but don't want average users blam=
e
> AP mode unusable.
>=20
> >
> > What does not work:
> > - The DTIM count does not count down. mac80211 counts it down once per
> >   ieee80211_beacon_get(), and the hardware repeats the uploaded
> >   beacon, so the count stays at one value until the next upload.
> >   ath9k_htc sends 1, 0, 1, 0.
> > - The multicast bit is never set, and broadcast frames go out when
> >   they are queued, not after a DTIM beacon. rtl8xxxu does not set
> >   HOST_BROADCAST_PS_BUFFERING, so mac80211 does not buffer them.
> >   ath9k_htc sets the bit in the DTIM beacons and sends the broadcasts
> >   after them.
>=20
> Maybe normal user doesn't care this much? But at least we should
> point out these points in commit messages. (No need detail. Only
> list the leak features).

Can you pick this patch with modified commit messages to your patchset
after it becomes PATCH (not RFC)?

