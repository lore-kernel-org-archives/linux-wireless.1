Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795795746;
	b=Sf9mHLm82Ad94bWpJYslF9uxQP0dt+lWagV2V4sDNqqdenLPy2jK0Yp/PJNwxses7wQU
	 DAXTyEUkYR/Rbxc8wlrtNLvLe/mAhCFd69pGZaUjeM9ih+j/lT4ZQrtZg1eilDXP/aLg2
	 EGDx3k8TjMy8jADnxvylLxg+HEZJIOlcknC1a1bUqX7lpaRKIxA2IrzStfKJku+L5UHR8
	 8u1D4vSNl+5H4sZZ9fqZwaguD9otxRRetZ8DuoRJ6iCFJGa9oFVa6zPgEyHiEUijg0KPk
	 aqOQDzzpxHX/0v6j7yOzjsmCLCdpXGlufSgCsr/8srviaSvka7a4XnGFK7tggrwEqYw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795795746;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=s2jiSbKwArmAI+haPiqL81oAn2gEmKlFsh+woXxKsJY=;
	b=IUWs4VRlpZzdewGe9ptFNN9VZzSYgWiXi6BrTd+ARkfM76QhBOZWWkJm/P0ia/QV1t7d
	 EqmQ2ad4DFEWbBF6oleFWwSEhUqqHJZHEPqv8cXG8XAK1P0vZkezEtSCtK/RLTvBrFSUN
	 mB4fJ98wWmD7shzH39X0549uzj9UJ2akSNpncQO9Lg53+8jTLzetUceye69uCcsVFfubU
	 HEWiRfeELUYnNoGwklKg8HEIHrGM2MmxjWiXhsYgye3QoDJZEx5TPuV0EA6KnqNkgzUB+
	 QxGD0qRwcQM06i/IcCnGmwf1pUKfKTjzBk1T5UUGO97OpIeMhANHg2UGH8PbWqpedng==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Bc/7N/8H";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.46
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10DF0606A31C
	for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 16:09:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10DF0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Bc/7N/8H
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-9212dac247aso82572886d6.1
        for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 08:09:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795795745; cv=none;
        d=google.com; s=arc-20260327;
        b=qrOs4gztra2IDoC/bREpdxV+rBhJyDrMQAR1LNp49nAy8mrD74DBQGoKqfGrkKMVSX
         q7VyISWekvm3T/Exh6OLfN5iqWrDW8IWzEZA9EUakERhsm7DPVKffuQ0RhiXh2FPgxkO
         aPxZ0XkNoXzdq3aj6tQfA2UhmNqA8NKsQJK8ImdAVJJdJ3uxHeBv6gQ5NZoyWnTOU4GO
         wK+9wgYMFXkIadkX9in4DyQSEI5iFp9cHNo/8G93qt073qBEnl9SAJFmKhA+9noqW4JQ
         iOMnM0afbAo+jo+M5N4zn3fuWRcKy3C6A3ekQ5uVR9EHqOLGswqN/Q3cPf7n9iu+iCj7
         boRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=s2jiSbKwArmAI+haPiqL81oAn2gEmKlFsh+woXxKsJY=;
        fh=g4qIvl6/31HtnerxyVK37f4FNVcorEF6JuBH5wiMpis=;
        b=oBCMQyPxlFwENflMJQPWTE6Tm++77odA/IV1QzxxXCMvye5c2DUvD6Sg6hjP1dNjqa
         46JIAlRR/cCvt4lIJbUKMN3RaRORFYM1gLlIyiISyn+1BqE1yegmBm2+GrvwEAW7n29R
         KOEAcJY/iuU97qpAoJADsK3YbUolAdFSTuMkqIEmLFaOyvRGhVykgZRnv9saBbdNO0QG
         BYE8rnmxjGsSh876eQhGkgNMY/jq7F4xZgqnlHqnzaXuVlDx9PUvt9QsZDdjENA4WjiG
         Cprg57iGKIv1gvj/erVOAc8qgRFp6j0xPdtOq3tVz71KWOvuwqlQ8akL8qMsZ6QRYk7i
         aJAA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795795745; x=1796400545; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s2jiSbKwArmAI+haPiqL81oAn2gEmKlFsh+woXxKsJY=;
        b=Bc/7N/8HhXaP2ofa4tKE7SjYoLnmCcDnXORZfpyYk+ZyC2b7lV+EVMIxbLrNei6HXu
         um9sGLKTro3U/whOKxXWSkdyfNaGTwIOUfEKYMTiR5DmZK6hcOhMaUEpeq0UHorg50dT
         I8nlCae7Nhaz0//qc2Xi6V2JUWKkTQnC6E+6tcF6leO20IHRb3hFr0vGOmF8kHfks2tn
         R2ndd1qR45WmulzrKxr7MyP/mvbqUBiG+oorBJQm9RBzKa9bAAIAEZSJ6KFYinFypnpD
         hQg90qZQx9HFgO8fKXg+fCl6me/Zf0662+n5QKoxv50gbuUc1k7nbSItxbPi1wXJ2HNs
         VQFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795795745; x=1796400545;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=s2jiSbKwArmAI+haPiqL81oAn2gEmKlFsh+woXxKsJY=;
        b=mFwgJj9PlgoFzaUxqGGjXQQ7E3LBxuf01gWDWKlQQc7NEMjSGsKBGbXiF7pSnmbaQg
         t1kv0lmI+GjuxsycCDUHY//R1aNlZThBQW6AFg1cYaWvamfB9NNKgTfxG/yacSDBUnkp
         muAT5pAEhC+Z7+RJ+D+xEk6ZHJ++X7tN3Fdzw+EsmJtqs97tXLgMiswfARaSPFo9lIch
         xAaM+LDTchk5Kos5AiwD5Z4cxESDzibdQObEWNpZeWGIkIxIpyXoDQMvyFD6NTEDJKU8
         aWIYnljWJs92LJHFfjltCRxuyIWWT7ciKbi/FZnu/0UyUV/IqbT1CsxqWJHfvtrskj8z
         xHtA==
X-Gm-Message-State: APuU4Z8hQH757kckYbtoqtuYYEbRG86k+RFUTsdEL8XIkDUU5EBXiavS
	PRmMKs3BL1tSOE5RdKiKMMFrYMnBvWvzSFmnwG+Exo+BmARZlOKXHmFJdrNzKdol20bqwltfwaX
	54FdTm3lWOKuQa7gJMNIN8bwwcHIK9IE=
X-Gm-Gg: AZFdTZdtU5nT96ytHmmA3Wn3RW5OS+JsrLAwg+I68tcGD1vj1FTezKIoOTQ2ayr3p+/
	TIZwRB8m56o15UXboaFPrzgwgx7aaTTLZMH9Ap62H8bCplJv/cAYcg/PbD6RDy4fmJTLVV9Geej
	UeT1ijwu/6rIDcH/uW7e4wzDDkbm5ChovHwSAjrDpTv8Ss5yiZUGFgBxhMrHIA4/mmdwE/6ZuBF
	Skg7w/OtrF38zhfpYsWuksPcg1hp2kD4ExSCPNYqTTO3jEfvqTI64cGnlVA9PMbYlEYDCGqpAdD
	r3cq7HpdAS8Gn2blkyKcUlrNy/Nr46sXy2z3ph9DkhWt94Q9jLJ3XI/9HR8SXYw013+TFI0+0Uw
	9LrXpqs1DFyjssP0nsYXLIS6RsDIcvhQ29/kcKk4KSLKgFEQrx1V6Xwlr/UuM8x72ryM8tpuQvt
	r4Uz3hBV+Whx/03TbdlKSIcKP7KmH7Tvpy2uUEVG6dDoFo770RlkvgKQfAP4MMnNHgqYqZcrnrt
	w==
X-Received: by 2002:a05:6214:5298:b0:921:2427:ac08 with SMTP id
 6a1803df08f44-92134a37147mr460963236d6.11.1795795744808; Fri, 27 Nov 2026
 08:09:04 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Lucca Moura <luccazoppi@gmail.com>
Date: Fri, 27 Nov 2026 17:08:29 +0100
X-Gm-Features: Aa3M54omrpYZzqx7HWu6Fl0tmhCU2ZWuVRbHcOHCxGtN5OKZWot-bjtjcvk_R_o
Message-ID: <CAJC97KF1omvgtJ=jsQpauVhrTdpr_WgiVDxs5eRCby4fU415hA@mail.gmail.com>
Subject: wifi: rtw89: 8852bt: "rf busy swsi" hang after AP channel switch
To: pkshih@realtek.com
Cc: linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Ping-Ke,

On an RTL8852BE-VT, unicast reception stopped right after the AP sent
a channel switch announcement. It recovered only after a disconnect
48 s later. This happened once.

- RTL8852BE-VT [10ec:b520], driver rtw89_8852bte
- Firmware 0.29.122.2, Linux 7.3.6 (Arch), iwd 3.12
- Connected on 2.4 GHz, signal -58 dBm

Log (2026-11-26):

01:02:28 wlan0: cannot understand ECSA IE operating class, 4, ignoring
01:02:28 rtw89_8852bte 0000:2c:00.0: read rf busy swsi
(217 such lines in one second), then:
rtw89_8852bte 0000:2c:00.0: read swsi busy
01:02:31 pings to the gateway start to fail
01:03:15 rtw89_8852bte 0000:2c:00.0: timed out to flush queues
01:03:16 local deauthentication, reason 4 (inactivity)
01:03:17 associated again; traffic works

During the hang, "inactive time" in the station dump rose from 4 s to
44 s, while rx packets (beacons) and tx packets kept increasing.

I can send the full log or test patches.

Thanks,
Lucca
