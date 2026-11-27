Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.40.28.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795792788;
	b=G28K/lin3VP3csDTfUVo6TgQ3aFvFaVqMDPSycZWLNYO3vpvT3ZNxe/AZjxty9jiYJFe
	 GQ7ok2gDuLorcnyKckqhAwx7L+3wquKzQ5/LA/pPnDLvErnVbkG5xawZqYkVbE/roHLh3
	 bo/665Q/GjR0JWeN1l9+Qd9LBn4KGYRaTfnfDhTguLb3DaUZ/RmUfIKt/eRP8Nk8gFj/N
	 x6XlLKToirsFKtX0E849rE9UduGm35w/vMuodUlC0G7fc9prCJpYtDV1T+1Od05YJcmoH
	 C+/0MX4JjbT/DfcQ3pHuyfNkLMgZtkdEEF40ejCdYDROP5peB5ZA0qx5w1ove4AQThA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795792788;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:Message-ID:From:
	 To:Cc:Subject:In-Reply-To:User-Agent:Content-Type:MIME-Version:
	 Content-Disposition:X-Virus-Scanned;
	bh=dkcMOzJjPc57i8bWfDakpUbthvo68oprBqixehbv5jA=;
	b=wKTIROkD+52T3SEgHDqw5rrclUx3ekvXLvbMNUODRNswGkfiURNAy7XSgIfoBh3vr8Yb
	 ot9iLJsVhNBxfDm8pPAjvJpSMgkJwLJwV6dC9kCWwCUzWMa88FX/TEJlJTZCfmPalTLf4
	 DquEuX3+eEB4wzH75kBP1dtGA/vbUtPAK7E74Rkm7XGwVS/s+xMTjthMUYPeP9olYADc6
	 9AUTcbJE3+Pn7LTMZHYfJ1E2IPETZbncU1rVRGy0RaucsV5ZBhA4KORQIA2Xd1cGT6RdE
	 DdwCikejjQC7dlTLzHXFKsK3BPhzLj6HfheBpte27UbfvsPbP3RwSBlqiiBgDpkI39A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=rfdeck.de;
	spf=pass smtp.mailfrom=rfdeck.de;
	dkim=pass header.d=rfdeck.de header.i=@rfdeck.de header.a=rsa-sha256 header.s=default2609 header.b=MQzEOjlv;
	arc=none smtp.remote-ip=188.40.28.6
Received: from www226.your-server.de (www226.your-server.de [188.40.28.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303F0606A321;
	Fri, 27 Nov 2026 15:19:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 303F0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rfdeck.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rfdeck.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rfdeck.de header.i=@rfdeck.de header.a=rsa-sha256 header.s=default2609 header.b=MQzEOjlv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rfdeck.de;
	s=default2609; h=MIME-Version:Content-Type:In-Reply-To:Subject:Cc:To:From:
	Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:References;
	bh=dkcMOzJjPc57i8bWfDakpUbthvo68oprBqixehbv5jA=; b=MQzEOjlvOUzyVgXzXAeyjP9p1a
	xQ9whmmhPeBOArGgBsozvlMNRrykCb4i3MJMQHdfff0wdfU5XnrdF0QBexKIYKUIUjOwjmFa16aCu
	xlI7Hew4VqJ4JI/5w+IaUBAoSp/UZWWqEGnGC4nWe5mSCW9j56+opULXGrW+z6mlFldqoHpKbmQsU
	hHWCjzzwNXwtzSW6tz10WRds2d0BFvXAFOZBo0av3puUwWx7Zy6sTwKc9eNwv1POx8mUvfYlCBkxS
	cbHICFEhOY0aIwZN5AhsQWg9dMDStsagGpVvGeT3POCzMoeeAzoM5SIVF4RXP1UxVuKYqh8VL3c/E
	vC1xXTeA==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www226.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <martin@rfdeck.de>)
	id 1xWxjk-0003eS-19;
	Fri, 27 Nov 2026 16:19:44 +0100
Received: from [192.168.0.33] (helo=mail.your-server.de)
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <martin@rfdeck.de>)
	id 1xWxjj-000HZD-36;
	Fri, 27 Nov 2026 16:19:43 +0100
Date: Fri, 27 Nov 2026 16:19:43 +0100
Message-ID: <20261127161943.Horde.JkGhYA0aQ3kFZkRWztLNi5H@mail.your-server.de>
From: martin@rfdeck.de
To: niko3x@proton.me
Cc: Ping-Ke Shih <pkshih@realtek.com>, linux-wireless@vger.kernel.org, Luka
 Gejak <luka.gejak@linux.dev>, Bitterblue Smith <rtl8821cerfe2@gmail.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFT rtw-next v2 0/2] wifi: rtw88: honour rate, retries
 and bandwidth of injected frames
In-Reply-To: <20261127-b4-rtw88-inject-v2-0-f9701b9243a3@proton.me>
User-Agent: Horde Application Framework 5
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Disposition: inline
X-Virus-Scanned: Clear (ClamAV 1.4.6/28194/Wed Nov 25 07:26:59 2026)

Hi Ahmet,

I tested v2 on an RTL8812AU (rtw88_8812au, USB, firmware 52.14.0),
5 GHz channel 36 at 80 MHz (5180/5210), kernel 7.0.0-43 (Ubuntu), with
both patches applied to the Ubuntu source (offsets only). Sniffer is an
mt7921u on the same channel and width. Each case was run with an
unpatched build from the same source and with v2.

Without the patches every injected frame went out at 6 Mbit/s and,
to an absent station, about 49 times. With v2:

- rate: legacy 6/24/54, HT MCS0 and MCS7 (long and short GI) and
   VHT MCS0 at 80 MHz arrived as requested, one copy each
- bandwidth: HT MCS7 at 20/40 MHz and VHT MCS7 at 20/40/80 MHz on the
   80 MHz channel arrived with the requested width; VHT 80 MHz with the
   monitor on a 40 MHz channel was dropped (also without the patches)
- retries, unicast to an absent station, 6 Mbit/s: retries 0, 6 and 40
   gave 1, 7 and at most 31 copies; NO_ACK gave 1 copy; retries 6
   without a rate kept the old behaviour (about 49); a rate without a
   retries field gave 1 copy
- station mode on an own test AP still works (ping 10/10)

Three cases arrived with no frames at all at the sniffer: HT MCS15,
VHT MCS9 at 80 MHz with short GI and VHT MCS7 NSS2 at 80 MHz. The two
adapters were next to each other (about -15 dBm), so this may be the
sniffer, not the sender; I'll repeat those with more distance.

> Luka, could you check the TX status of injected NO_ACK frames to an
> absent station?

With your debug line (debug_mask=0x2), injected unicast frames to an
absent station report CCX status 0x80, both with NO_ACK and with
retries 0, with and without the patches. So such a NO_ACK frame comes
back as not acked here as well.

Thanks,
Martin

