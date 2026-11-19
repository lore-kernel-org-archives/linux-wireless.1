Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.145.95.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795086902;
	b=IAI0ZnP4666zlsRD51CLKAZfSzfGOl2AGBnmE0X2S76TtwDZVarAVZc+FQpn+G/8uf8d
	 AAITZYQbPKXJneOmpRDJfpUan3j13uMrLf39IY3MAD0xgvgK3yM/C4JaMlU0lrqzhc/Cy
	 iOH0jZRIR61lAGQxM5aFjgIB6CgaJ77VJv+TFcbwlEvJ0HGy8M1GpXNFdawVwZ2wO2OUW
	 g/WigU3gr7E5zfRutH6iyJB+AEIEQcXWZgcKUuezd1K0DHsTmr4fVkshX41KJzw4a/LWf
	 rkz0WKO419qQ90oWXv+zURuDvbzCB0uui4cZN2ahA/Q3szvkTg/Pc3WLXxuA2aR48rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795086902;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:
	 References:Date:X-Clacks-Overhead:Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=YGmcDizx3Ucl8MvLJ9Vv5bqJkI0YuXA3vmqW4QU5klk=;
	b=OZZjKKkywhP1mGMGPQ9FQ45NrqayBDe98fcTOZNu4DfKGpv5zYv9PL9lHWi9dPXzO+xm
	 B+TcnJ85fdcvHhYhM9TEqtZtLhBz9+qNHcMBTTZN+UOLSuzhJpw2qbX+z0MY5K4ADsLNY
	 lVJJ5uRQSqEXMbJGJowH00xtJX4vXmFB8oWWHSlQx3I0KIz8EeBSM0uF1O+wOdwTJeUbq
	 BZFxXnKXEPrm/EW1mc5QqE9r+pBIUCT5Gxfjge+A5LqYQ0Liscu3j3eabhh9My6Vplk7x
	 LiIr5NAaK8ydv9mIKX1+lZIrxc7tBXvauxGcqkLuLUKcroibUSfOoqITMWtcptjsLXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=toke.dk;
	spf=pass smtp.mailfrom=toke.dk;
	dkim=pass header.d=toke.dk header.i=@toke.dk header.a=rsa-sha256 header.s=20161023 header.b=rXn9l0CS;
	arc=none smtp.remote-ip=45.145.95.4
Received: from mail.toke.dk (mail.toke.dk [45.145.95.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3E4606A32A;
	Thu, 19 Nov 2026 11:15:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A3E4606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toke.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toke.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toke.dk header.i=@toke.dk header.a=rsa-sha256 header.s=20161023 header.b=rXn9l0CS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
	t=1795086899; bh=hVdKjiF7+S2VAphb5azVF2/bga+Tm/+SNmLdDkAQWN0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=rXn9l0CSdQdzbkiSZ2Tjoc77d7ScTl3GxYOYmmkUxo8LqCpISvnFHZJWZFjhKKLsi
	 l3aaJDfIKbUhOFkDb/OqRng+Nx+PZX8ozT8YtsJHuNxPfpoqYbDT4xetfNpawzyEsP
	 3y12WGC9zQg16vi/wkCTJiz2HHrBgLocYdwhJIenl1/iSKPqw+G39poIWicWcIh/GT
	 SbsctZGAwb3UvhDyxdmC5+Q75rf/8h4mS9lgLWaB/tZEYn0zcDZLfSof9SFDuw3qYM
	 UKoxgOnvu973s+xfygGLyUZ4KLhUS5AIVEhUO8mtdCMF2NzdfpSAYDF6g+KaFjqNdP
	 vF/sckrwhZJUA==
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
To: Tomas Tonhauser <t.tonhauser@pobox.sk>
Cc: linux-wireless@vger.kernel.org, Felix Fietkau <nbd@nbd.name>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] wifi: ath9k: fix loss of non-aggregate frames
In-Reply-To: <87y0ap2hyy.fsf@toke.dk>
References: <20261028171652.1125692-1-t.tonhauser@pobox.sk>
 <87ik1vu8m1.fsf@toke.dk> <av6NT4zjbfMuk7Lf@blackbox>
 <874idd3xv6.fsf@toke.dk> <87y0ap2hyy.fsf@toke.dk>
Date: Thu, 19 Nov 2026 12:14:59 +0100
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <87v75t2hu4.fsf@toke.dk>
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

Toke H=C3=B8iland-J=C3=B8rgensen <toke@kernel.org> writes:

> Toke H=C3=B8iland-J=C3=B8rgensen <toke@toke.dk> writes:
>
>> Tomas Tonhauser <t.tonhauser@pobox.sk> writes:
>>
>>> On Tue, Nov 17, 2026 at 10:09:58AM +0100, Toke H=C3=B8iland-J=C3=B8rgen=
sen wrote:
>>>>=20
>>>> So an alternative solution to what appears to be the same problem your
>>>> patch 1 is solving appeared:
>>>>=20
>>>> https://lore.kernel.org/r/20261110170459.31857-1-dominikengelhardt@yma=
il.com
>>>>=20
>>>> Could you please check if this approach works in your tests (with or
>>>> without patch 2)?
>>>>=20
>>>> Thanks!
>>>>=20
>>>> -Toke
>>>
>>> Yes, it works. I tested Dominik's patch instead of patch 1 on the same
>>> AP (EAP225 v3, QCA9563, OpenWrt 25.12.5), with patch 2 switched on and
>>> off at runtime by a test-only module parameter, alternating runs.
>>>
>>> With Dominik's patch every filtered frame now reaches mac80211
>>> (tx_filtered matches "TXERR Filtered") and the mac80211 retry gets it
>>> through:
>>>
>>>   Strong client (-50 dBm), 3x500 pings at 50 ms + 3x25 at 1 s:
>>>     Dominik only:       0 lost, 105 filtered, 103 via tx_filtered
>>>     Dominik + patch 2:  0 lost, 111 filtered, retried in ath9k
>>>
>>>   Weak client (-75 dBm), 4x500 pings at 50 ms (1000 bytes),
>>>   3x500 at 50 ms (56 bytes), 3x25 at 1 s (1000 bytes):
>>>     Dominik only:       4 lost, all of them XRETRY
>>>     Dominik + patch 2:  0 lost
>>>
>>> So Dominik's patch makes patch 1 unnecessary, and it keeps powersave
>>> filtering intact. I'll drop patch 1.
>>>
>>> Patch 2 still helps with frames that exhaust the hardware retry chain.
>>> The link was good during these runs (3 XRETRY in 2000 frames), but in
>>> an earlier evening test on the same client it was 130/3000 without the
>>> software retry and 1/3000 with it.
>>>
>>> Dominik's explanation also matches what I see. The strong client got a
>>> filtered frame every 1-2.5 s with no XRETRY at all, largely
>>> independent of the traffic rate, and both test clients share their
>>> block of eight key cache indices with ESP8266 clients that toggle
>>> powersave constantly. That answers my open question from the RFC.
>>>
>>> I think best would be to have my patch 2 on top of Dominik's patch (I
>>> can post it now with a dependency note or wait until Dominik's patch
>>> is applied).
>>
>> Yeah, patch 2 is not really a bugfix on its own anyway, so we should
>> take that through -next once the bugfixes are merged back.
>>
>> -Toke
>>
>> pw-bot: cr
>
> And one more attempt for the bot:
>
> pw-bot: cr

Sigh, that was supposed to be from this address. Sorry for the noise :(

pw-bot: cr

-Toke
