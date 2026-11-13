Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794587909;
	b=HUl4eOB3KxLSKnoJdjQ8aZwToF0wKNX9tdWjYionp2I+eYB40iH4mzKX/bGV7dwB3rJ5
	 ScLmJvT4waWXIe48TltIeUBImj4YOaf86zWd2pGUnb/F4GGKxFkKxH3FFAqUBGFCPIhLr
	 a1z3pPC+11yjAh7E51OT0kcc2Byw0Ed45i3oIyKCg6cWjb4mSqO0nonhSG839yUxWCDJo
	 Cjc2NnNFaXADHXF2AOGbcb7eC1TA2S6XqKZOYITFz8O5+L30hU9wvxsnpn6elIDA7NcF8
	 mRRR5CONdww0ESCgkvHWDM3KlCcLV3XcS68sZ7C3XZoCryXV8uag87epgphyQQMv8Lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794587909;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=VDLNECdA0FBaXHTSLIloAx4woCkfXU3kTb2oMb3EtF8=;
	b=3p/MmF4Ds9JwlGdHuR6iMjjtKZ12Iw5qMd30h2/V+9SBKQzRSB16G1j4V1YOsJeyIxFy
	 zLNy7OJ1D5A5QOxM0eyPU4zXbJSbRV5FXWgKsPJ/DjQ2clC8zmu1DMIlOqiAMAt2Irfh6
	 KnWyAjwjforlHNIXGIbmq/QXMlxy04WttonlQR8ILKFRKz81aKbgB2ap9XgRfJU8ixASn
	 M5e3D5yYobUOVs9A04nLImvPw250/v88+3cL9+f1DL351ltqvQgoFCKjhXUMsywkmx6ZE
	 UqhPk2Q+Po/ZjBaoywioRw3IFk2XQfX48hlTCVcuXFaSusJ2zuSTirICpFW30HmsnoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=justthetip.ca;
	spf=pass smtp.mailfrom=justthetip.ca;
	dkim=pass header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=KD2+EhXU;
	arc=none smtp.remote-ip=91.218.175.172
Received: from mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070C5606A323
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 16:38:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 070C5606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=justthetip.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=justthetip.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=KD2+EhXU
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=DsGGhe6H+IGHcDdWBvpB1dyDTEzqyfLJyAsQ74U7qq4=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794587906; v=1; x=1795192706;
 b=KD2+EhXUJBEmQl6/+gIYJutPhf02ryv4DR7JRL3c3U1kWcRRD2NPfpv1lpSFzsRFR/uhu1R0
 T0xadheyvZJljtSAEPzyqxMmAMRn6RjK75/oGlTEK5/YDHqaF22tdJhOJMEuwG/InJFIj1yXWXc
 xMTZwZaf/H0q3TaKso3he7Qa3WTO7vjYDhowtQe4COZrzEcFcHFgRwYNWDhQ1fCuv5awojd3s/B
 A5Lb5DK5YD0cgStSuvqhvNrAHhJHDcObb3CUSLoKeeqo8u7rVTq+ChPH8yG/EDf7IxPMXM6Da7T
 dpgjfw74BBnXJZe6V++OqaaguocDrgq8oCZ67Sdgs9RXA==
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b5216aaa9e58c90f;
	Fri, 13 Nov 2026 16:38:26 +0000
X-Mizu-Trace-ID: b5216aaa9e58c90f
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Chris <hoopyfrood42@gmail.com>
Cc: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Deren Wu <deren.wu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Javier Tia <floss@jetm.me>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [RFC PATCH wireless] wifi: mt76: mt7925: get the survey airtime from the firmware
Date: Fri, 13 Nov 2026 09:38:23 -0700
Message-ID: <20261113163823.8252-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <CAHaeJsSSYkJTiXAh3PJtfxmXYdPf_-u3OPbunB=GsYXbVAUVrg@mail.gmail.com>
References: <CAHaeJsQLvC-KBEpy5qu8iYxSB51mbHohrPvN4PJushF_Tk3foA@mail.gmail.com> <20261023180554.7266-1-lucid_duck@justthetip.ca> <CAHaeJsSfoTxJhWVCrELCiLZr1zD42LGJUvrmf7oSzRQpwh6-jw@mail.gmail.com> <20261024173414.10559-1-lucid_duck@justthetip.ca> <CAHaeJsTHykkk8Cm+FUZW2RmzzmT47aJNxRR1kpymhDvknnhKuQ@mail.gmail.com> <CAHaeJsRROtH4CLVR8mhWznWq6c5mLqLsn9j=6EXPgFUOW8t26w@mail.gmail.com> <CAHaeJsSSYkJTiXAh3PJtfxmXYdPf_-u3OPbunB=GsYXbVAUVrg@mail.gmail.com>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, Nov 12, 2026 at 11:30:19PM -0500, Chris wrote:
> Just checking in on this one. Is a v2 still planned? I’ve been running
> the RFC on a Netgear A9000 (MT7925U) since late October. Busy time now
> follows the channel, and the readings look right.

Yes, but it is on hold. With the A9000 at USB 2.0 the firmware is slow
to answer the query during a download, the query times out and the
chip gets reset. MediaTek's series for the same counters does it too.
I wrote that up here:

  https://lore.kernel.org/linux-wireless/20261113150048.5271-1-lucid_duck@justthetip.ca/

v2 has to get past that first.

> As I mentioned in my last reply, I take the busy, rx and tx deltas in
> 32 bits, since offset 19 wraps about every 72 minutes. Since then,
> about one reading a day still comes out near 2^64, so roughly 2^32 µs
> below the previous one, as if the counter stepped back. All but one
> were on 2412 MHz. I haven’t dug into it, but it may be worth a look
> before v2.

v2 takes all three differences in 32 bits, the way you suggested. With
a wrap forced early the RFC steps back by 2^32 us and v2 does not.
After that change the totals can only go up, so is your once-a-day
reading from the RFC as posted, or with the change in your driver?

Thanks for keeping it running.

Devin
