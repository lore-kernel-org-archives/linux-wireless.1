Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.145.95.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795085016;
	b=5EC28MOKMxpL/JpjoDkOANBJeRf6K2+B29seJjuV4UviHJaGnDscDkLmQUB2aOgGLN7n
	 G2aruJ1Dgz4WZf8mI87z4VBasxJGTdzZCbvV+ErxuXN6Fcm9kATg49lE4SAPvhjrbk8tT
	 D/CHW/WBX6lxnraKLldjazNx7xGpFynxf4BO5ryvqxR2X2BFC5iwH2e2r+FDpruFLjD+k
	 U0ofVUN9lXFCy/IoRn6QmzNVgn4pcOLuyR3j+lLa0uW0ZwJcxD6KhBWmkKpHFoGBhsYnU
	 pZYD0JBbuX9Hu/fq2vtCd1evqKrxYjkCVHTPsG2AppKyBbtzCIBPKKP58zia7H2YpzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795085016;
	h=DMARC-Filter:From:To:Cc:Subject:In-Reply-To:References:Date:
	 X-Clacks-Overhead:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=SRMct7i7SEO/QBiTF2LpbXTHEabq+rTxeYW9zZbmA9E=;
	b=SyZSZNURkx3Ai1p87ZXQOpyo7hHOUD2yU6L3iJtkXcW1WBo12jSdWYyEpxoxS3nk5c/d
	 IyWYKAt4Du4YRrH3JXwyXRU+QNVIIIFlQtSUB1VsImvdPVgQK8mDBnZe+29Av13cSv0og
	 s3pMy/mVWvsRnXx5+PTnM6gLlpvds281DeV7EscgH0g0CfRCZEjHAYDlQw386mg5h+XDU
	 t30T7w2DoUc4jLTSniOs0jgQPi67Z7BBbPdGhM8oB3ZP74O58jlJZQcPxCGMKjteQg5eF
	 Plqr/6nRMedF6aKKguMtaR+XNV7vsbmPhswV/DPCqEhjz5+sr0fj+NBUZRGBzIdcP2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=toke.dk;
	spf=pass smtp.mailfrom=toke.dk;
	arc=none smtp.remote-ip=45.145.95.4
Received: from mail.toke.dk (mail.toke.dk [45.145.95.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7838E606A324;
	Thu, 19 Nov 2026 10:43:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7838E606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toke.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toke.dk
Authentication-Results: mail.toke.dk; dkim=none
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
To: Tomas Tonhauser <t.tonhauser@pobox.sk>
Cc: linux-wireless@vger.kernel.org, Felix Fietkau <nbd@nbd.name>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] wifi: ath9k: fix loss of non-aggregate frames
In-Reply-To: <av6NT4zjbfMuk7Lf@blackbox>
References: <20261028171652.1125692-1-t.tonhauser@pobox.sk>
 <87ik1vu8m1.fsf@toke.dk> <av6NT4zjbfMuk7Lf@blackbox>
Date: Thu, 19 Nov 2026 11:43:25 +0100
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <874idd3xv6.fsf@toke.dk>
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

Tomas Tonhauser <t.tonhauser@pobox.sk> writes:

> On Tue, Nov 17, 2026 at 10:09:58AM +0100, Toke H=C3=B8iland-J=C3=B8rgense=
n wrote:
>>=20
>> So an alternative solution to what appears to be the same problem your
>> patch 1 is solving appeared:
>>=20
>> https://lore.kernel.org/r/20261110170459.31857-1-dominikengelhardt@ymail=
.com
>>=20
>> Could you please check if this approach works in your tests (with or
>> without patch 2)?
>>=20
>> Thanks!
>>=20
>> -Toke
>
> Yes, it works. I tested Dominik's patch instead of patch 1 on the same
> AP (EAP225 v3, QCA9563, OpenWrt 25.12.5), with patch 2 switched on and
> off at runtime by a test-only module parameter, alternating runs.
>
> With Dominik's patch every filtered frame now reaches mac80211
> (tx_filtered matches "TXERR Filtered") and the mac80211 retry gets it
> through:
>
>   Strong client (-50 dBm), 3x500 pings at 50 ms + 3x25 at 1 s:
>     Dominik only:       0 lost, 105 filtered, 103 via tx_filtered
>     Dominik + patch 2:  0 lost, 111 filtered, retried in ath9k
>
>   Weak client (-75 dBm), 4x500 pings at 50 ms (1000 bytes),
>   3x500 at 50 ms (56 bytes), 3x25 at 1 s (1000 bytes):
>     Dominik only:       4 lost, all of them XRETRY
>     Dominik + patch 2:  0 lost
>
> So Dominik's patch makes patch 1 unnecessary, and it keeps powersave
> filtering intact. I'll drop patch 1.
>
> Patch 2 still helps with frames that exhaust the hardware retry chain.
> The link was good during these runs (3 XRETRY in 2000 frames), but in
> an earlier evening test on the same client it was 130/3000 without the
> software retry and 1/3000 with it.
>
> Dominik's explanation also matches what I see. The strong client got a
> filtered frame every 1-2.5 s with no XRETRY at all, largely
> independent of the traffic rate, and both test clients share their
> block of eight key cache indices with ESP8266 clients that toggle
> powersave constantly. That answers my open question from the RFC.
>
> I think best would be to have my patch 2 on top of Dominik's patch (I
> can post it now with a dependency note or wait until Dominik's patch
> is applied).

Yeah, patch 2 is not really a bugfix on its own anyway, so we should
take that through -next once the bugfixes are merged back.

-Toke

pw-bot: cr
