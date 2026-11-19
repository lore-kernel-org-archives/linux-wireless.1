Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795086728;
	b=s/lkkGHHrAhnqeGLhfCcr0skuyudTAf2fDYeROx9HKzh+0475umNGUd/dAnsmTQuD6ev
	 WOZ8MHUN33cfI0ygHfIAAh7Lz2poWF7rsJblfiDFpIZL+JAbYc3IbPvK4SdKQdBzikwSX
	 JIIxURid/mfYAcHYSV8jdfFi1J3ojpC2UDfvma790Wj7HQlv8f2isjREYpEnD0nwUzVAk
	 FgyTf6kTfHB81upsNsibTYDrw+62iOzhwY1HbccCBa31BtYU2NS1ZH8hu07NjCKGdUNIj
	 HtPc8Otix93RzOAqsPsoHUGfYBU0c7QCOwH2vWhSluP5ly6ntA3amqrfIyULEf0fmHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795086728;
	h=Received:DKIM-Signature:Received:From:To:Cc:Subject:In-Reply-To:
	 References:X-Clacks-Overhead:Date:Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=O1ULMmK5vDlelGy6Uiiyqfs1TziBqEGo3lEvPcTtbVo=;
	b=kBAPd0jLjeOOI2K9IqkXVZjCUVkKrphB7T8pSvPPledPgPptsUjuoCJaaANqwD2+TVWN
	 oWPZ+RATZ4CLzoofCvlsiAyh0gFUxg5YUZWLDBH4p7r26MWG3DtOBAeZIxRZ1oSfuq3wv
	 dasr+O/ywl2IIAniHFpqEwpKwJXg0ZUFm6vmfxkrPAxzENSMsywqJ2Q7WxcliRyuYugwY
	 YCjfh7Psj7YI81GnN77UnrOd8nU9jvYOQ17avBSrm0xLx9VrG9et+Uzi3uPh8pZSDDiFL
	 WaimXjTsfEqDjSVl4AQoAcpKvOof6ambL2+v1icFFsy07SPrmQF9nIIesnNeX8IAnlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NqegoJOd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99175606A320;
	Thu, 19 Nov 2026 11:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NqegoJOd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ECA11F000C4;
	Thu, 19 Nov 2026 11:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795086728;
	bh=O1ULMmK5vDlelGy6Uiiyqfs1TziBqEGo3lEvPcTtbVo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=NqegoJOdQZL/ky9MemDMHBbEXTP9jbrmZnjBiFCjPA0HKy+ucf20FrW+VQIinYbiQ
	 ml/AJhOLOemE9FwhcmrC0bwXQU+Og3S4jZfDWWqIyke3ba7USLdV8uk5muAqtSFLUY
	 oFyoOj60uXNjWC0GtT8smL9NPuecuzmGK8ukubOXRuH8xLQtpw8C02NrEfuHiYKTw7
	 lp+JakUUXexLCCG70EluXrzIEYWPLY95ncSMjeqwTbkTFvFBmVqDT2gct1GV4bEYjg
	 EvYZL7Q9CD4Q5qbQbgkVC7Sm3u5IsvCsQPvmK9C1BMqi59AD1l+ZODMHatQucKzpjo
	 o+bdc2pMkvL0g==
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id 9B74AB738CB; Thu, 19 Nov 2026 12:12:05 +0100 (CET)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@kernel.org>
To: Tomas Tonhauser <t.tonhauser@pobox.sk>
Cc: linux-wireless@vger.kernel.org, Felix Fietkau <nbd@nbd.name>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] wifi: ath9k: fix loss of non-aggregate frames
In-Reply-To: <874idd3xv6.fsf@toke.dk>
References: <20261028171652.1125692-1-t.tonhauser@pobox.sk>
 <87ik1vu8m1.fsf@toke.dk> <av6NT4zjbfMuk7Lf@blackbox>
 <874idd3xv6.fsf@toke.dk>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Thu, 19 Nov 2026 12:12:05 +0100
Message-ID: <87y0ap2hyy.fsf@toke.dk>
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

Toke H=C3=B8iland-J=C3=B8rgensen <toke@toke.dk> writes:

> Tomas Tonhauser <t.tonhauser@pobox.sk> writes:
>
>> On Tue, Nov 17, 2026 at 10:09:58AM +0100, Toke H=C3=B8iland-J=C3=B8rgens=
en wrote:
>>>=20
>>> So an alternative solution to what appears to be the same problem your
>>> patch 1 is solving appeared:
>>>=20
>>> https://lore.kernel.org/r/20261110170459.31857-1-dominikengelhardt@ymai=
l.com
>>>=20
>>> Could you please check if this approach works in your tests (with or
>>> without patch 2)?
>>>=20
>>> Thanks!
>>>=20
>>> -Toke
>>
>> Yes, it works. I tested Dominik's patch instead of patch 1 on the same
>> AP (EAP225 v3, QCA9563, OpenWrt 25.12.5), with patch 2 switched on and
>> off at runtime by a test-only module parameter, alternating runs.
>>
>> With Dominik's patch every filtered frame now reaches mac80211
>> (tx_filtered matches "TXERR Filtered") and the mac80211 retry gets it
>> through:
>>
>>   Strong client (-50 dBm), 3x500 pings at 50 ms + 3x25 at 1 s:
>>     Dominik only:       0 lost, 105 filtered, 103 via tx_filtered
>>     Dominik + patch 2:  0 lost, 111 filtered, retried in ath9k
>>
>>   Weak client (-75 dBm), 4x500 pings at 50 ms (1000 bytes),
>>   3x500 at 50 ms (56 bytes), 3x25 at 1 s (1000 bytes):
>>     Dominik only:       4 lost, all of them XRETRY
>>     Dominik + patch 2:  0 lost
>>
>> So Dominik's patch makes patch 1 unnecessary, and it keeps powersave
>> filtering intact. I'll drop patch 1.
>>
>> Patch 2 still helps with frames that exhaust the hardware retry chain.
>> The link was good during these runs (3 XRETRY in 2000 frames), but in
>> an earlier evening test on the same client it was 130/3000 without the
>> software retry and 1/3000 with it.
>>
>> Dominik's explanation also matches what I see. The strong client got a
>> filtered frame every 1-2.5 s with no XRETRY at all, largely
>> independent of the traffic rate, and both test clients share their
>> block of eight key cache indices with ESP8266 clients that toggle
>> powersave constantly. That answers my open question from the RFC.
>>
>> I think best would be to have my patch 2 on top of Dominik's patch (I
>> can post it now with a dependency note or wait until Dominik's patch
>> is applied).
>
> Yeah, patch 2 is not really a bugfix on its own anyway, so we should
> take that through -next once the bugfixes are merged back.
>
> -Toke
>
> pw-bot: cr

And one more attempt for the bot:

pw-bot: cr

-Toke
