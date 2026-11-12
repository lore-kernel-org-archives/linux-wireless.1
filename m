Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794442929;
	b=3rZzy430pt+NRnM19mCod2MCQmVlrWcsu+7Y6gEWTg4uXVg3idC961qBV6kldHuFQbjL
	 NQtDfgYIXTlObmtx6KMT4VUKGPONO8ex83n3HyhP5SS4ffkPRl03zijj+/xkFSxxr63QN
	 hDW6KnrH6gdkCjAY/wBkP6nHXC/hCvXvPYeyimx959EJGGUdbGRhB1FU90/Yqwor0i6pY
	 Y9mvQk8FN3wl77idKFLzeuQO+0AaW8CssBVMSPOH/cM8eBqprE7q7Iqdklohwo0Rc/DOx
	 c7izQ1nXzxi2HJROUQM3BbJ7dUywIGovawLjVn22FdUZDJiRw2fvyvd7fYDvtTsxG5Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794442929;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=Ozi/jJGilFFBpMvx3kOD/uL7Gb1XLAv7dVXo80M+VSY=;
	b=sKO7kJ0Q4CNlB7RVk8t77qRxhsGYKdN8WI/RD9bZpL6ybY0uOk6Zlti660S6AYzFBRAl
	 03RYDDZXQsr/Jw6qLHwDgT4uoFsF4VOkQON9vqIkY0e7I6ggwUAqR2+r2ZYOhlShfCgyM
	 NMjD7VepJ94xohvylgGhVSVGkKW3B19Pu9VYecNRTkVhX4DnhieZZYerGlTuRyIepYMJo
	 GYEEszvdiIwFzk5Co3Qxs0Zv+13uilJUYq2IrwSeR1m51UyZOBX1DLTc1KVayALDjgUKA
	 g7g66WEQUc0eycmgIXYxOcADF46Yex+Ztnu7dNRDKLjEDYCJgaqhVbTzc3su0hQa31g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TNA3rNBl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.45
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B9C606A31C
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 00:22:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6B9C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TNA3rNBl
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-99c0c1d07feso1712342241.1
        for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 16:22:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794442927; cv=none;
        d=google.com; s=arc-20260327;
        b=CxqMV+MPNYQ8XN16R+32fhDaOJcgPqWscekXuNdZY5kJHtIu07UhB1j12DMbMOu7AT
         lNBTXdrJ2/o3sdZLg0UuNmgUUzImJvHlnrZqLt9jJb+UBMByaeWHJeLxzdo1A+YBWgUG
         LJsHJEJTSZYc9S0P5paTweS4bbaHW+s4a6F6MA7WwP5YqNzI5Ju4hQlE5ZClSSIj/55V
         uFx9l5s4BfQnjoYB4kZ+/TnWk+s8eBZ4/8lFGPCN4+7plTYSLGRi+e96X0N72V3iyxQN
         WLpjszF8ntgM5xsxL8MmjuNBdgQtcRfBL2x0lvm+Ozwtl3ILHCtc2IoLPcEfLD8MY2R3
         Z/0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Ozi/jJGilFFBpMvx3kOD/uL7Gb1XLAv7dVXo80M+VSY=;
        fh=WW/2C15mmnhLTJAJsCF/3JqQ+zvt4VqNZSI5Cgf0fZI=;
        b=gcQy7PaYHoqIWxvJHbB/5YYVIYNamz/aF1JQJybSK5gC/Ntn5F1cTQyfMpatlRrYEE
         p0o6+8Pkt+EsKL3j39CadLXbB4CalqGJkJJ7d0Vz1nRUwo5oPcVhU9h4GH6L9kl+bFel
         Onb0ltm0gxqD8LD4naJIrW9foVhCctWZjvLqkGgeh+5cxIeOpim4U/inS2JH7EhPc2LC
         HMU3IbLuU0rTr3O8iI7q+YKCzmnv9tkgI7Kfd1uSjPyjSSBfTY4hQ7tTvjepzIB4mSBc
         nLdIcD582NB/XmcCx96nshm3YQ0u4HR1I1eqo3vIMibiMZTeObX31Gy+3igbV9dAztsn
         bOWg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794442927; x=1795047727; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ozi/jJGilFFBpMvx3kOD/uL7Gb1XLAv7dVXo80M+VSY=;
        b=TNA3rNBl0tFaL7kHNFmXxBEH2Ygg8edHMxuX2HTKd1kQDr5cBw79mz3IEtNyw00lv4
         59pNjIILXPw3w0j4IR832Syg8eA2dc9i9WVtHuVtId/oRrT9btbayihQr4ODfefgPgY4
         g8c4IMHLv9kbqaSdIoLp1NGti47vp0ZgSZOnLt2DN85yCeEqFDMj8aKBL+sQhMpg3Ux4
         bZvn9zCCzLUNjjvPZrDDkUwhP7aJy4zxQd02UA/oiwdNworirWPkfEyltWfbgMpRH0e5
         iRnFdVs9aEdEe82Kp3dS7PLv1k4u+/x/fWaK2vdfEsPkwzVNGvoKlW4WUOV/lRTL1r2y
         3SHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794442927; x=1795047727;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ozi/jJGilFFBpMvx3kOD/uL7Gb1XLAv7dVXo80M+VSY=;
        b=FM5j5E690UYzym4p3trIgoq9E0jyDyT2wqmzc4VbTAHcYN//VnLiPlGHqusJhamJLj
         mKvYLoWsUucFGgPHMaUTreLargTBKVK32ZKwQhQVj7UD97cJxUoc9+zjT85+Mn3QJv/w
         bXfQIgmokYavyWBubbKAwh8hPcK9Fg5JURyuXYVw4hnaQOq22LhKrQa9WrAJJ49ncRri
         0a3aEFR6vGR8DHftOMkCTmL6sciyysEFQ+LtjI97tP7XdrHsjtDaFuWRmEGjifIH4qhC
         mQNXW6w+q9kDpY5E8eHplPyKsvl1R8lpHmtQZmMuYrQmVTyO+Q4tY9GkjBVGI6RuiPXC
         NoeQ==
X-Gm-Message-State: APuU4Z/KlfIhDMYlqZkAQZlvfMdGjRRyLDSCADwGVfdbHLC62tiycRLN
	L2r1/feDrVtd++NdgIIL/RzwmxhhzeTG4Vky8J+2FU1+B2vl9DRyzg2ywFI5uwsxZzITZeLU2tZ
	SdB5X7yT7s1jU5oWlBWDA0xtIvGx/tdd+N6NY
X-Gm-Gg: AYBFou2Ek+ek7TpWCye3vvYnDoI5EbIyqdczxQ9QiWKpSDkFBsLlpA+FwEJ2rmRV691
	ui/W5XW/0rdHbh0FaWwpUHbaqtQQtHHa6P7dkpAXjyOfjCw8OGm05Z0XmHXXJvp6ZCKYQaUZcZJ
	EcypNXF71ZaTSDGX+LOtgefteNLrtQULhnsCPMi9KlfEHHmSU8U8AkQyrQSSNqyQ2jSgtYBH368
	dmr5I7xi57SLm6h1ksA+wQ9Y+FYnil3ggAmZu28G4WSl4MP/6mjfuWzqTRzf09g5LhkplxoooDl
	dLN9G9nATSJIT2jOI+D8kkCZ+BFP67wpauk38rex6WOtNxdou4GQ+UXpMmj23ACPYciiJZkYxyE
	xH53Urbz1EWkHftgXRJiC+78KEcnKU4sCzzj33/OgRm1/mxMLzusniRTxXtl2eG25wJjrEiDI+W
	AYayGmUUIE0FcI6V3Q
X-Received: by 2002:a05:6102:6052:b0:7c1:62d2:e18a with SMTP id
 ada2fe7eead31-7d4fb2b00b5mr1487732137.16.1794442927584; Wed, 11 Nov 2026
 16:22:07 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-ath12k-sta-vdev-start-once-v1-1-a01ed78d5460@gmail.com>
In-Reply-To: <20261111-ath12k-sta-vdev-start-once-v1-1-a01ed78d5460@gmail.com>
From: Christopher Griffin <christophergriffin05@gmail.com>
Date: Wed, 11 Nov 2026 18:21:56 -0600
X-Gm-Features: AclHuK9XczOR4dhNeekHBYBO-ZYIGUvSQou0O_2Aj7mVpoHb3t7HKJ4KtEblBJc
Message-ID: <CAKobHXBJ68qUT5vSPmY3stt1Cfc=toMvGyWUBW7mwfAbfVBTgA@mail.gmail.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: stop a running station vdev before
 starting it again
To: jjohnson@kernel.org, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, 
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>, Kang Yang <kang.yang@oss.qualcomm.com>, 
	Birk Skyum <birk.skyum@pm.me>
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 11, 2026 at 11:53 AM Christopher Griffin wrote:
> On ath-next this exact patch is compile-tested
> only (x86_64, W=1, with and without [2]).

Since sending, the exact pair, [2] and then this patch, has run on the
same station: the ath12k source of Ubuntu's 7.3.0-1004-oem kernel with
both applied (offsets only), WCN7850 with WLAN.HMT.1.1.c7-00108,
against the same EHT 320 MHz AP.

The test was 13 connections alternating between EHT and HE
(disable_eht=1), then 20 EHT reconnects. With the unpatched driver the
13 connections alone gave 34 timeouts, each station query then taking
3 seconds and reporting no signal. With the two patches there was no
timeout, every station query returned a signal value in about 10 ms,
and the kernel log had no warnings. Tracing showed start, stop and
start for each HE connection, the stop coming from the new path in
ath12k_mac_vdev_start(), one start for each EHT connection, no
restarts, and one stop for each disconnect.

This test and note were run and written with Claude, an AI coding
assistant.
