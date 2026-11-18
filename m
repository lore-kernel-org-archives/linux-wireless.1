Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795005797;
	b=lniYGER1dNA9P17hqnLaKetg8tNr138q3n4i9OEFTM9EgUSkxu9clrEijy4i514MO9vp
	 HKE6dVuSo5JJl+pqmghw1ZxmRRWxm018y0j6my43CNYGG2ZqG/W7xCXYPrxLo0NeVWSVr
	 Fj+3u7QIJZt3wHCyVfOxKGYuUtTjloaYzBhBzKNZxlu/9a2iYxxo9zh8QN/X0QYujRXHL
	 IhM8ODtOSWVmuvCY6XwGOIT5jC+qd0zA1dKl1grtvofjg4Sk3X7blZHFZ2KsO1AFx7/iv
	 Jd/191J4wldaCHirB8oHv3Tt6FYWEQNMtgDP37QA/yQgT7L6DoEVjg905dwUyYqjbAg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795005797;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ykhNTsChJJUlt1URM+zfzHn3YiACgwozf/JpK+p7y/w=;
	b=rAnNYb37UAXTnbQoH1PUaWBp1g9IJ18y+VWkNsxkp6yr1Kvo6LCOWm4ydK5UEsSPLTOh
	 KT72YxJSSTDeHb0afXYwjavyh1AMQBlP/7hLNKn+ZERA1eFKyiRJminIoQTRNhu2HPvZO
	 cXMNMvu2VLXi37v4FLHy/3fBoL58+6k/fnTUaS2aLNFf0cBzFcoPaGPDmIYyLQxyr1gnA
	 jJERsV8RL2xn8ofKf4msytGJ/1SeLrDqdFGQy82FEaGzuSBWdspmIgJ+dp2DQNn95cj5t
	 3/urCa8b5zVd8HBKB/80EsKmuQ8kVHhqwniiaHTtDHoBUSQWlHd73D2Q/oj0YS2JQkA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WWfXVVVm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41676606A31C
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 12:43:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41676606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WWfXVVVm
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8b2382bf051so592667b3a.3
        for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 04:43:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795005796; cv=none;
        d=google.com; s=arc-20260327;
        b=UJNewMm9gooQygg3R44j7YLyWE6GzvmLsZ7kaTI29RHeUjqsZkOD24ZKEAL/0Mkbqe
         pmFN6e+UddtQReNJ0ODG6ZVWcX4S7nsRTQI40b7j4V+QTzdz46eP13p2MFIsq8S88MJp
         IfPVxioTQvNSR6WGkb3Q17AbjTVes4eLpxf5v7DH2dipiZzQO0mcX02jQzxi5AtT/DOe
         ZXcx/s+M6JT2mq/QeQYHfJQSBAtmILn5dmB43r3liPylZG8P4Fb2oLiroOQR1eBfHpX/
         WX1McoFWEMWDaHeoNL4Xm9xxBBt5bRQogBNCi1+8uXcbJDfrlMST1iu98xxAC8397ciO
         GP7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ykhNTsChJJUlt1URM+zfzHn3YiACgwozf/JpK+p7y/w=;
        fh=ksMl51igvge1aTbaR2zQ7oLNmS8Me7DNtW+RZC+16Mc=;
        b=NQGptEhkAhNLAhkGH1+4JIbW0W8YUUMWUib9udbLDIRM5lhz+N3P/CFWQgIGwnzHDG
         8lLzxZn6CRUYmx7nOEoBqDkWFrh5ALKRMwOxfzIP8p3UTaynqazHyD5a2ESrn+yxUen3
         DZ5RtTOkCQvfYbYnhQJ4u09iwv9uuDSiuVoOB+VnBBPzihRuxSUOtqjz/tmVwGiRkXFQ
         E8t5yMbH5rFT6ja+tQKbVQN5sf/tAwAQJ530f75D8ufoVQmw4zx2CsW5Wn7GyzcMJAV+
         9NtXoKjYjWp9X8m4cR1tfeXziiGeUk8rHu+Ktfn+nicVvyLN32/X/yZ2h5QZZ7YA8W9x
         qQ+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795005796; x=1795610596; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ykhNTsChJJUlt1URM+zfzHn3YiACgwozf/JpK+p7y/w=;
        b=WWfXVVVm65m5zqNiU5xGHg7FCSXU1dJ1fAAnU/3Mo7niTgQvpVMmbrv1Hi+VgqDV1+
         oNbDM8gixa/0spzLTTTc4lg95eyfO0zohrm5bThoD0QFoaeOkSOaAnmFyuzLQLIb30zW
         n8hxLqTgSklSr0Ym15gnAg1ryYoiPjS0M5FFK0hqCsBrVbRE00L2gCZNPsAGpAcRCiFw
         Jgru4F3k0WHHdtD7xCX1GBonc1g/1eJKsh/Z6V/sFgLMKQdM6OCRTI6w3R/1jH8HrdQv
         tiSfkL6iQM2n0qToFco2aCIX4ejkyWS+Utd4JXdbf3Hxo8Yn2joDfRvW/0yFb0Xye9od
         rerQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795005796; x=1795610596;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ykhNTsChJJUlt1URM+zfzHn3YiACgwozf/JpK+p7y/w=;
        b=NLX7WEORmKqcvHad003Yd9/5ETglZvmWyoWSsITbqZ37snbzpZVw3jd95dNS4Ctgm5
         xaGbgnso6lOszAu/fSd9d4Lh5nNK7Xy7C/+zI/LDAy8KJS96Dxm+6ytCzUwPZd7XbrDN
         5gjLjlJww1IUn2ucKmYLaN5XQcPzV6wNyiqjXGKF0qZNalLlgkxGGo7p7At15WT7Usq3
         AEv3JFuuOitnaX9nXeVC2WWyy71/OFXs/aN7VnRKpPUsbq8U5uIj10KdUEXySb68m8HJ
         V7cJ/Wy5D0aHQW+Q98uQBw2MXyeohqUPs6gUJfV4vYLH3antvLpiAewZxmQ5+mF/MDoD
         wefg==
X-Forwarded-Encrypted: i=1; AL+hErEtBJfgEE+/PRMzYErKokyf/JvPRyd3SeRpokFHTo1knzqM15KyE7g9Vk+CzBB3GKqprDsIoKzxzFbHTUgC9g==@vger.kernel.org
X-Gm-Message-State: APuU4Z+Xr+rSfuIVGzpnkB7inxUuIXK9Yow+dlKGCjI9pHry5k36YwKc
	iu0uUY8P2WscK0Fxl+eE1OWGCPvWIJ9aRBuVyCnwjpX3jpU3BRkBc9oAC36h+2xYEkWfrpTipW1
	ZsNNBAeaapDDMiU8ncO3iWnBPOlSbq04=
X-Gm-Gg: AYBFou2fJiezpif6W4wyB1ZlEZlYNa2nho2MMla+iAtgs2cMQ5rbkSV9kSr11IukCPr
	yBUp/jyUW5G80QGiNDsQQglBlh/p11jhMHtHnhuqBdEtfX1zN7QsXojeXhIzhLKXMdp0X5lcpOX
	T8D0/MTozL/ZXqSu+wYQ2xHKNkXZx194KyrMOxjhLry9PwL8oFhNABlc2S52mB/T3MTruVBCQQ6
	pQAsDF4Rmck5AXl3Sai8VPN/ArEwWacICi9q+rY1p/ijp6ljcWfcc88pCA/f4f70uxxoHtuM48O
	AuX6y/l5Q5uj16Ibl0jYcqoaKRxH9hdd5TIxZfK9hqN/OOVkMUdyHotgAzgG2FoQhykUZ1unLiq
	nYsbRbJG6eayEegqvUDkoNcpA3i97UN4szo3jJUQ=
X-Received: by 2002:a05:6a21:798a:b0:3f9:6c37:4b43 with SMTP id
 adf61e73a8af0-3fe8a0219femr2566464637.45.1795005796480; Wed, 18 Nov 2026
 04:43:16 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115025635.40010-1-lucid_duck@justthetip.ca>
 <CAHaeJsRTd5KjN9CsKDU-g8Ut-WfBuiKkTnkBSZ9hQSsr7P_HQA@mail.gmail.com> <173fc5e8010e9f01a9a11f0d98d0934c8b8ccc09.camel@mediatek.com>
In-Reply-To: <173fc5e8010e9f01a9a11f0d98d0934c8b8ccc09.camel@mediatek.com>
From: Chris <hoopyfrood42@gmail.com>
Date: Wed, 18 Nov 2026 07:43:03 -0500
X-Gm-Features: AclHuK_uO0t29yrPw6mmFLmOZoUGZqSgOHrTkJfrQJOhwlG-rwXsTHRJw0FHFNM
Message-ID: <CAHaeJsTWY4UOgAmj-F18Mi8CKCMWvQ=d2S8dyF_fyaqiBcxPZA@mail.gmail.com>
Subject: Re: [PATCH wireless v2] wifi: mt76: mt7925: get the survey airtime
 from the firmware
To: =?UTF-8?B?TWljaGFlbCBTaGloICjlj7LlkJvku7Ip?= <Michael.Shih@mediatek.com>
Cc: "lucid_duck@justthetip.ca" <lucid_duck@justthetip.ca>, 
	=?UTF-8?B?U2hheW5lIENoZW4gKOmZs+i7kuS4nik=?= <Shayne.Chen@mediatek.com>, 
	"nbd@nbd.name" <nbd@nbd.name>, Ryder Lee <Ryder.Lee@mediatek.com>, 
	"lorenzo@kernel.org" <lorenzo@kernel.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Sean Wang <Sean.Wang@mediatek.com>, 
	"floss@jetm.me" <floss@jetm.me>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	=?UTF-8?B?RGVyZW4gV3UgKOatpuW+t+S7gSk=?= <Deren.Wu@mediatek.com>, 
	"stable+noautosel@kernel.org" <stable+noautosel@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 2:23=E2=80=AFAM Michael Shih (=E5=8F=B2=E5=90=9B=E4=
=BB=B2)
<Michael.Shih@mediatek.com> wrote:
>
> Hi Chris,
> Thanks for digging into this.
> Short answer: on MT7925 the noise floor is not exposed to the host
> today.
>
> For additional info, the MT7915 and MT7996 chips are for AP. While
> MT7925/MT7928 are STA roles.
>
> I've also checked on our MT7925/MT7928 chip's FW, and here is what I
> know:
>
> 1. It's not in GET_MIB_INFO.
> Neither the MIB_INFO response nor the UNI MIB counter set carries a
> noise / NF / IPI field =E2=80=94 they're CCA/ED/channel-idle time counter=
s
> only. That's consistent with what you saw: mt792x_phy_get_nf()
> returning 0 is accurate, there's simply no MIB field to read.
>
> 2. Why reading IRPI directly gives zeros, and why IPI_EN "didn't stick"
> + caused MCU timeouts.
> The IRPI histogram registers and the IPI_EN control do exist on this
> chip.
>
> Thanks.
>


Hi Michael,

Thanks, that settles the MIB side: no noise field in GET_MIB_INFO, so
mt792x_phy_get_nf() returning 0 is accurate, not a bug.

On point 2, it looks like the explanation was cut off:

> 2. Why reading IRPI directly gives zeros, and why IPI_EN "didn't stick"
> + caused MCU timeouts.
> The IRPI histogram registers and the IPI_EN control do exist on this
> chip.

The mail ends there. Could you send the rest? In particular:

- Why do the IRPI bins read zero from the host? Is the histogram owned
  or reset by the firmware, or does it need some other enable or bank
  select first?
- Is there a supported way for the host to turn on IPI collection on
  MT7925 (a firmware command rather than a direct register write) that
  won't trip the MCU timeouts we saw?
- If there isn't one today, could it be added with the firmware change
  you mentioned for tx time?

A noise floor or IPI histogram is the one RF figure we can't get from
MT7925 in monitor mode. I'm happy to test any firmware or driver change
on an MT7925 USB adapter (Netgear A9000).

Thanks,
Chris
