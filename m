Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795822359;
	b=jiXs3zUWk05cRsVvWpCLqQ8q9rEOPRJkeA2YPMPAlKiOFMq4Z417uf9bHO0kPEZVJivB
	 YfB05aUy2IHHezi/+ZVlQgrKlhJCaonagY02k1+ITPFhmCjO1usLOdAYNYh3rz9fGS0I+
	 lU527ZK+RED5f53VHM+y39FunXJ6WPb+mbpiGNO8ZjXrfFrBD+0JM/OhsMq3xiNJnDZHY
	 mmlmmfRsn/uYWt5X/xCpXvH0nGJ+aI9EpFS66SYO25/jjSa3SE4lm5AYSQQtMii8xA1Z5
	 heD+z4843LNHhlaI4Bd3TJ01R32bH18mUf4tunGYr985if/zuyxLEFrkuHbuXdyDnSg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795822359;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=nJLFwVyGSFKtJluQ0vECCLVVb0kUyc7qHJd4lZiWJM0=;
	b=qPslM8fBoXGOJMP+et+JPjUbmtX1KcUUoAzkFix+9mFlIQGn/tK7mfrwC8bwssMtW7Ud
	 GJnXDNMcgoats7u50xWp2vvED7d5DD1AJ4kJ5MPumT//OCjtQW3boItd6VbHcgLMtsBuk
	 kLQDvKNHGhE0EKq8s/3pDkzAWet1BYD5jtbJ4vh+d+3MvjkD91QU9s1ofrA665yfwnGvn
	 oRc/mQTUEsjU4b2H84exidd09TDPJhN08+cCQzUTErpM3lLGJWCiilC4kyFt8ac4EZqGU
	 IqLfW2i0mBN0e8kjiBIxEYAFRyklkty5jnT08XSKWdcrVD41p2L4E4VVIQOioBnU3Ng==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Grh7OkKX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.48
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C5A606A31C
	for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 23:32:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04C5A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Grh7OkKX
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-7d2da1667b2so5231358137.2
        for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 15:32:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795822358; cv=none;
        d=google.com; s=arc-20260327;
        b=Hox2WxwM8LJpsTCnGiGr66tKaiF6bpQmrd7bJ1CF4NJn9qDmwPTRWpfCtKdUc5kPXn
         RFRGTin2GZ+r8Nfc7Qe5to+J5PLikVjAMmtzc/fQmRJltJUwYlxWx5wJAxaeRAsjyDbp
         nXh9l407EGTX+6IYj7B7NFUkdkYc7tIaM5CXRfhzLRRhJq4W6jqG3BocnWaMuMnDBWS1
         5k3o/JOEEB2MXK0FijGEMBxwhNYGwuu0v8LKQRtJ3oaSHkd2SOlFx6ZBS1Jmxmz16Tqn
         P7B748BLdwscn8K92BpkI2lUy06qFqBaSlUEayFr9Fr8nZ5FtotMpvgFNHVA+51c7nQP
         w+rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nJLFwVyGSFKtJluQ0vECCLVVb0kUyc7qHJd4lZiWJM0=;
        fh=iwT/mg301aVpxGNoIdvVZFxtyPxx2MKeasgpiOBj02A=;
        b=iBaMYAr6/Lhkqdd5jwt+PjSoVtOIbPM/5md/XlRD/S3jdx0S8ah+v9z1gFWUA+tykj
         sAve2GD6pE+K57mrDANLIln7OWiw44T2BvsT6hc8NdVLQVsR1cc0jmF5KmIAOhNdt67E
         Au0liwgY7pxxgiefjGNG/agUjo/R0ku7P6LNhKd3965XfDnbD3wZltjFRB8RnGmrVAZR
         JQ1rVvXKjaITagBfJmGAa3HRUhG3/UD/DqZWfoAGKemlnKu71p4aWLerD+cJgxOfwbhC
         8e1kv2T9ZIvYQ/kflmwv4RvsJLJ4ld3sBjU7HfnFGJp/n0F8d7r9p4X7eXAyrvMGPMww
         lITg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795822358; x=1796427158; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nJLFwVyGSFKtJluQ0vECCLVVb0kUyc7qHJd4lZiWJM0=;
        b=Grh7OkKXBCCdd/u/nZcmj6nlPcA8auajW9Q30Qlj4g6lLBGD+aBd1XHCGNPbDi86ua
         JobWkPClk5W1Z6ox82qxtPuC9hQNykK1j++esRqnpP4f4UjmNqSkmOKKUHgQhENqIauf
         vvKD/kb6yncpK8PPWY2F1fB7F/Q0ExmQR404a3vIOLK+OU90wXlLiSi280Cpj/y6z+5v
         uxT8uhc7UtvFL0XvWRlk+/cnwPssYtXnANRU72+twWJwOnJYneB4dyZFYr6z/BpWyhLx
         saQh/MVQ+KzqVPhkAXMwxw8h+hyPi57EF0oiDsjcidql8VEUpNccUR8lJhiW2Cg6c68u
         Qgyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795822358; x=1796427158;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nJLFwVyGSFKtJluQ0vECCLVVb0kUyc7qHJd4lZiWJM0=;
        b=Y2+85l6TkM2IDAb2lyhqntbmnuNH2yBLKQvmFEQTWyozfVM/yU5cwuFAg2w36DQilE
         dGX8EC7DFr9hH8rH/oFisGJyMNofeaU3wxRiWpnIGBSivt+upKKs5wf0upZ+wguvMZUg
         DX+A00BiWMFLXyuZ5R5nfGIg22rmHr+6xIEJO72MTcNqYavT8BRcAXMMpStvJFWQ+FPJ
         B1NAeyhQf08ro8hm+a4UAdj4zkkSMZx/2JFguggqaOcAydT43ZcL76jm7Coy6d/kAKBl
         hPH8+c8Q2DmUHGRVuge9vOGVbG5jH9Ft9LfGColDMe4FbsHKUgIelYj8LRuuWQZ8V5FF
         Y+Dw==
X-Forwarded-Encrypted: i=1; AL+hErG1LrQzWqdj5dnP1UF46CrZGEuQMAWmBB6mOlRGMRa/HBQD21+z0GX3tz9TIWqn1EujPalu88ASoScSEBAjug==@vger.kernel.org
X-Gm-Message-State: APuU4Z/dhtxI0gHOxdGpafDEMyTqsbPvVTi1K3+LIu46AqeiYbZ3kFU/
	nOfPiSH4C+kEQdU4MFg4X0ceJU4NgKzb+qs8giBJrLiwvIihJdwyueqt7QcgwGePCKtOgHvbMvE
	cfSbYdw5CK1CmLsaB5UBnrYVKnI3gmYA=
X-Gm-Gg: AZFdTZckCjgSuU8YU5vzxz5hewmN1qDgP4leTsGGE1fQ7Bd4jWL3cH/gk4nAOHtjoiK
	NUZTDudJhG0fTa+2gPZiDu1QasdObOI4NzszYJ+Y++EFKyzPE+pho656iMWyjhQFK0Aku5KZVRS
	S8PLdA2xh585vqTXSa1LhHLsVRYDzJYs9CDaDc4zLCianYvzS9LGSA5Ar4L3GIlryYtz5288ogU
	J4LrxGriYFumQbJOgst6SB+hXdjANyhJ6voQKeJzvDpBfxHdhGAh4qiBKuxW8UhHWAd00+DMchL
	7xJnWnebJIWKEjrsDLGfJLaV53YQRanzY9D4V3CPcvWCqCzm4tXAe1QYAFfPDyZG6Mnbd5DK31w
	0UrMoDmO/NJVXFqDh3+we8tFxf1cbq0csy6Mu9ogEmDkZJNZbuZ3zGnOm2mTMY+8dwaxxPBCYho
	HIkvJWQAyt38LDMpUXMw==
X-Received: by 2002:a05:6102:504e:b0:7c0:cdd9:31c1 with SMTP id
 ada2fe7eead31-7d73937ce2amr15746879137.12.1795822357816; Fri, 27 Nov 2026
 15:32:37 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAKobHXBuRr2Mz=yqFoqzQpeL9nY6ZeXY1HftEwyUxPYoDkS_+w@mail.gmail.com>
 <CAKobHXCMdy1YT8SO+kkZP9sCr+KOhOXU+if_r=_hb_5pgKO0mQ@mail.gmail.com> <CAKobHXBhqnB0c2gDEn+so-0AMFg5aj4pv=rEey9mCLHgHy-pBQ@mail.gmail.com>
In-Reply-To: <CAKobHXBhqnB0c2gDEn+so-0AMFg5aj4pv=rEey9mCLHgHy-pBQ@mail.gmail.com>
From: Christopher Griffin <christophergriffin05@gmail.com>
Date: Fri, 27 Nov 2026 17:32:27 -0600
X-Gm-Features: Aa3M54o0Cilpn-RiqwLvOGqLbPq-YK-n2NeABQpxrpOlU8rXz05Tgh__x2jX12I
Message-ID: <CAKobHXCa3z8WjQ_DAT0oMyOJ5rhzi9W44JK94zOcRnzvZ+==vQ@mail.gmail.com>
Subject: Re: ath11k: QCN9074 public firmware stalls at QMI cap request on C-360
To: baochen.qiang@oss.qualcomm.com, rameshkumar.sundaram@oss.qualcomm.com
Cc: jjohnson@kernel.org, ath11k@lists.infradead.org, 
	linux-wireless@vger.kernel.org, vasanthakumar.thiagarajan@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"

Hi Baochen, Rameshkumar,

A follow-up with timings that narrow this down.

On the Arista C-360 (IPQ8074 host, two QCN9074-family cards), every
QCN9074 hw1.0 build in linux-firmware and quic/upstream-wifi-fw,
2.5.0.1 through 2.9.0.1-02175, never answers the WLFW capability
request: -110 after 10 s, no SYS_ERR, no RDDM, MHI stays in mission
mode.

Two other builds do answer, on the same cards and the same host:
- the vendor's WLAN.HK.2.5.r4-00683 answers within a few
  milliseconds;
- the WLAN.HK.2.15.0.1 build from my October mail answers after
  242 ms, on both cards and on every boot (241.8 to 242.7 ms over
  eight card boots).

A fixed ~240 ms delay before the reply looks like a bounded wait
timing out. The capability response carries the EEPROM read-timeout
field ("cal data supported from eeprom" in ath11k), so our guess is
that the capability path probes a calibration EEPROM. As far as we
can tell these cards carry no EEPROM; their calibration data is in
the board's flash. If the probe waits with no time limit in the 2.x
builds and with one in 2.15, that would explain everything we see.

The same 2.5.0.1-01208 build that hangs here boots on a QCN9074 in
another product (IPQ9574 host), so it is specific to these cards.

Could a QCN9074 hw1.0 build with a bounded EEPROM probe, or with the
probe skipped when no EEPROM is fitted, go into linux-firmware? And
is there an OTP, board-data or QMI setting that turns the probe off
in the current builds?

Thanks,
Christopher Griffin

The tests and this note were prepared with Claude, an AI coding
assistant.
