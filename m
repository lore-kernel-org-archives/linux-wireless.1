Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.167
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795442166;
	b=YPNypbFBSUn/y9HURSgEyHIPc0Hw68VKTwPFKdQRuxATT3EhZ6X62icsrs1Pb/xVr5lN
	 xhFo0vou1wZ4uglqDeJJaB8T3i0Uz5Cidnwaaz3SCTzAJ1aMHYJZmZ7F14dS3tHaIz/CI
	 /XUpHWBSz+15DF4jjh5Bf9b/3519rtrAubKc4FpfkRy/n8A525DnJtV6d8l/KxzF/Ru4t
	 71SPLmPjiAPYUQevkyB3sx0EoBHqWNh7kD79LSe8mbJ8hy1+3lx2a3oBHZOuCyv+wcYkL
	 LosN4eb+59OtVrA8QexF3oNrI6vsRWK4lfgFnGL17LeJ53qJF04/Qo+KXNCtmKQmo3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795442166;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ePu4rIT2kwcS+IQNwzGcsAM5fGpd3GzOAKw5Kwy7uXI=;
	b=O0Q6ukOfS3XCogVaFfJeeWT+ibFsIS7SNmmcn5chGwnmTGFntiFqBpXJcG030CYD7TLx
	 qHQEh42LmZ9ES07XwXA0Ehhbegj9Zy5HxcQ6qwCfkevozKFbxJ06EKcQtaLLOoMYp717c
	 C0aCw8DjRXOmytnyljrqTlrQGFsSRMV1PdwxqiJNBqbPw4MEDcfBixliSgGlOgWpbOCoj
	 +PdwPlQXe+I7/JHNDr5TcWVeQlpRek32bXi8rjL3R3xyd4khV5k1pfj6mxx2fhP8OuG0d
	 dKJD5urTXfLrTuJaBwRkwk1zh5K3wsErQOfcfjCUo3YTPOFTiqHxfNZ1cSyseQ32V3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=qZLsA0wT;
	arc=none smtp.remote-ip=185.70.43.167
Received: from mail-43167.protonmail.ch (mail-43167.protonmail.ch [185.70.43.167])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28211606A321
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 13:56:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28211606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=qZLsA0wT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1795442164; x=1795701364;
	bh=ePu4rIT2kwcS+IQNwzGcsAM5fGpd3GzOAKw5Kwy7uXI=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=qZLsA0wT2DP6G3vjZOyVHIUsUBlX5/kdBxIeLshrtmDujGhWfwTpl3JXQI0FKlS/S
	 fOsf1BPw/9i8LOKKRkddnuAGiaq9qpIpF0GsfxAoeeJeMgbStXIPEIbaVbSvmxndfx
	 frJbJFroctkC9wj36iA8o8vwJOPsE2E7rCacPuf5z2g80uGvS266X/GCd1uA5IEOqe
	 oXV6jNO7peg0eUD0neuwT/ahKjqlwy5h5X6aK/5eQGdHLY5XM49Xj1A/VjCbR08Ety
	 RQ5ZHfkBIwvSrnuG2YWKX3m8Q0c3a0X5nHxDemCXbxNFAdK5qV0ILTZ703l0trdXjq
	 eSVVzmfhovA1g==
Date: Mon, 23 Nov 2026 13:56:00 +0000
To: "pkshih@realtek.com" <pkshih@realtek.com>
From: niko3x <niko3x@proton.me>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "rtl8821cerfe2@gmail.com" <rtl8821cerfe2@gmail.com>
Subject: rtw88: injected frames ignore radiotap rate and retry count
Message-ID: <sz_DHzKsOepyz69cMCgwtDkF_KWzFDHlbuRsiUI4mOjDDIL1G4JvoK43-NbdZqQmfxQhtIqH5sMQpPQ5wfwYMrg6oDx2mlJ-x_rlqNB-pJg=@proton.me>
Feedback-ID: 201311995:user:proton
X-Pm-Message-ID: b8b01c1396ee4843c1c62234e05c803a7576d317
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Ping-Ke,

Thanks for taking the rtl8xxxu injection and TX status patches.

Looking at the other Realtek drivers, rtw88 seems to have the same gaps
rtl8xxxu had. This is from reading the code, I haven't tested it:

- the radiotap rate of injected frames is not used, so the firmware rate
  adaptation picks the rate
- max_rate_tries is not set, so mac80211 clamps the radiotap retry count
  of injected frames to zero
- the requested bandwidth of injected frames is not used

rtw89 got this recently in e96abe4fd7c ("wifi: rtw89: consider data
rate/bandwidth/GI for injected packets") and 92608bb5f14 ("wifi: rtw89:
honor ASSIGN_SEQ, retries, and NO_ACK for injected frames").

Would you take similar patches for rtw88? I don't have rtw88 hardware,
but I can write them following the rtl8xxxu and rtw89 changes. Could you,
or someone else with an rtw88 chip, test them? I would send them as RFT
with the test steps I used for rtl8xxxu.

Thanks,
Ahmet



Sent with Proton Mail secure email.


