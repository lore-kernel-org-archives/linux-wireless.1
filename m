Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794293861;
	b=TzKtelIykUYgkBearIK7IR1nQrtcEu8+eYTCOdbHPOvQrVbvbwDwh0GXrDWmwkWZZM/g
	 qh/mKqKO0nxLgYceGlXXtypsJKQisJ1TrUGuF22Y18/wzKQObuNjwtCPBTKA6z6FbOz0U
	 5KxukXC4SRR+QvBf6yc8RTEYHBuKs/kjbDmflPzsQNVc/Y9jP5UJa/nBsPiieIcc1NrQp
	 bWZ144CN6/EHkUlcxAq8f5kH0SJ/8FgGOrkYNxoyUchI2UxMGgfsJCQySgjBx3L32khz1
	 JmGJC18BgrwgNkXUonTnnuBcFNluc2HiUTDcFLaIe3gmdz2o60viN0eptZeeyDK6lIA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794293861;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=FNCN9F8ROMGrrVoJ7iFWkLhPaPG6W+ai/dJpDmC52jM=;
	b=avn4YW4tntehQjD+Zw7ota/2qdls33Cp+yXfskIlxzHpxqwAZEoneWrj/Rf6ClKFpU6o
	 8bAcAkhuMyK2hJc+22Te5a7ChLPLpq1Czsdd2R7/MO6SC3mkemUIbGk4Jnp+3P1Mdj2SX
	 Drr7WAm+XoRYlVhtXXVDYN9PrTZSGa1JDAcxWZJQekjECkaWW4aANw7Oa/D96/po61ARl
	 tes+FcTuQfvceSSXiPHdxp8/REEraKKl3cxg4uO1filzgir8XE4l1yuiR8JymWNzFPn2A
	 2roDwAPNOznCJJ3a++WV/+wX7ublC4dGKMpGx4NwZo/wUcHxnExGXD9yb8QDyUiPA3A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DYx5x3k6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.54
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B933E606A31C
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 06:57:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B933E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DYx5x3k6
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-98301b325c4so384840241.1
        for <linux-wireless@vger.kernel.org>; Mon, 09 Nov 2026 22:57:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794293860; cv=none;
        d=google.com; s=arc-20260327;
        b=KsHbb1qF/eJk/yD2JoBeYwbg8a8E06ItcISz+D6BIRSjjvKK6gSQDIyF+nKxxlLx4U
         6RZdNonrGdB6owAToA/wpPT4X+MfcWfo+dm2O3TsDmPMt6rOzZjZy0gZ6ihYMdt2L2sc
         ieN0WvkD0fXZDEVyKsA+8UDYjZ5uPoJfB5njOkWtN13Nr7HlzjXIwiBdZGxJpUBfm4HO
         /aiZQIUaa5hri3KdIJXtmbwqwrTYQXGPYenT2hs5vao0oshnJLdIWTfLg/cMB3TV0OoZ
         we6gqloCTOKDhCY8SE8eRBX3MbxpvwoPCMkrUpxTEy+m/l1Z9wAVIpm0wDT5zD9BxJ1g
         T0pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=FNCN9F8ROMGrrVoJ7iFWkLhPaPG6W+ai/dJpDmC52jM=;
        fh=LtnSzzuADquGMtK1TA3PyKmceOcxzvRNiHQnUtQf/V0=;
        b=ja/YxHYtDt5WZeFtnFNcu+gxaK2W2tojS1yyCvWFJqFYMAgSCqgDmMpBOfw2o5pvkX
         wZxK9woXoRodQklISQWeNpRypbxZ4n7d4Oz97geRGqG3lXLZlXiwho4n8TsUHjnGA1PJ
         cjHnu1FCZHequwDZLDDruggVwCo+baumjiKjTZetH2lEht4utDgZPznWL0OhyKpUTOp+
         HIS5ABRzPUpgJ/sVJGntxaXh+wadfN+pDrtjXVpHRk7J+os6kUHNmxTj90uCHyifgx9C
         vbJDQ8hJw3cudW0NkpJIlwdBODxMmf8Wzq01X0UcdvsSGLJTTWT4x1s6asUZD7X52H9U
         /T/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794293860; x=1794898660; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FNCN9F8ROMGrrVoJ7iFWkLhPaPG6W+ai/dJpDmC52jM=;
        b=DYx5x3k6BHls5LLaGg3W/SFXDaPSyN2VxVGh+EtpC8tX9NY9SHSnCzbswcuRzBWtAu
         2JsFyctF09tSkIM5XcoHrG8fCj9W9ERFb/3133QsrxbRiQSt29Y1avDqpL8dZXu027vI
         PCtKrLzlEO+EXuEXAWOS6Jre7uXy0hgMJC/+dA4RwaN7crRRwcjuKkTKkAf4FriyEXbF
         vWHIITq+gjFie/ph4NN/R8A75p+VwBuz2YnYMa8jDacDbxXyhPDzofd/RCpJqgie6Ot5
         vBfKDPRxaQzHVxq+NwXUhnRiY0quw1pbkhCCY7Hyzc9mH+YiJ3YAFu2xRqPwWtR2xS43
         XDew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794293860; x=1794898660;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FNCN9F8ROMGrrVoJ7iFWkLhPaPG6W+ai/dJpDmC52jM=;
        b=XQeGzLC1YpPn/Zfi87hqlFSqmR/wMC9rME4IanBrf00nKUOgTl0y9criqgubk7M9ey
         zoefowPOWHbh1M5OAo9Tg43568iy+yVZeqbW/7v4ooBHJu+e7oa/m1l0s3oVJW9y3yZq
         Wrs5oDK/RMOl5YVMilH6ZpuHGiDa+qhNRvlbE8ZH4iyBWDcCm83/V37CqT6dC5UEPqNa
         toP5RDPQeV1mPx680LAYxPe4QSWz4F7fdwYIcf9PUXeDDP8cjdXmLur/K1IXUau3F297
         hmRS+65yRQp083rgUH/ZhEckhVyeicnuw8PB1lxzuE0mFup8M/20Vs/61Sx+ybyzSkUu
         /jrg==
X-Forwarded-Encrypted: i=1; AL+hErH2dGKkTmTcstcnKbAN9AJ6DdLgqeJApWfnCjSFoBCzya6dipYNUZN+Z9mcx1gI8K5KP+BsW+34IjNIAaUJyw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/Xt+wOULWIdg+BAJaqfegMrxr6oe0lxFrzgtae/4gOyryUTrej
	Zd98fbpXMHIQEuSMQ/0inAkjUHyoFMlQ+yBpbODeXwpuBrlC86rFpwCO5R90481jakt4B1z5OA7
	vjeeogcynCE3pp/zGv4C6iS7FyXoenXA=
X-Gm-Gg: AYBFou39ZSgMMsclZdZ3LFgzALyu52nTdi5avnAs+MHLd/1GC1wIu6QfUDFdmevjgck
	cKGuANFW1ImkLjRxPsomakA1aAm6zRu2cNyVovRD6hJJ6/LBpSeMcpdZtS6HnbJiqGr6b3iggDN
	Em8Ljgiy53tVGeTJMqN4EBNxv692JfJMnJrQlqgsZl9s8wl6usKsNSI2V0ZJTYJoxcFVwB4Vn8O
	HSDlVh6U4hx1JdGRevuLBk8H1qP8tYZTxiiVFoKgNP28KlBtAqg90N9H7r2h7qmMFsBW8y8qaXX
	drwQMlIrFtmmG0HulZXA74YEtpLySuNm93mXHL+39VKR8LhYnZidw7bWEa+6rE9kGOi2hwOeDvO
	qLfMwWrezPRaYtPrzlSomLCtlgYGdm0+RPPs9PDEIwFWnnvqM8KP2LzObs+9z54Eh+TQGeGbyC/
	VhUqUjxJkoKmVssRJS
X-Received: by 2002:a05:6102:f13:b0:7c2:5692:1917 with SMTP id
 ada2fe7eead31-7d301b8446fmr459013137.10.1794293859655; Mon, 09 Nov 2026
 22:57:39 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Christopher Griffin <christophergriffin05@gmail.com>
Date: Tue, 10 Nov 2026 00:57:28 -0600
X-Gm-Features: AclHuK-ugbccll-p_Y-1vjiqdOoRo5wtQJSfTOSPG7IArA7RJi8LRKvYE_A9LRY
Message-ID: <CAKobHXAfLKmJWSP_xNKwmNVkd4M92XhVXkVMcG5nxCBnbphH5w@mail.gmail.com>
Subject: Re: [PATCH ath-next v5 0/9] wifi: ath11k: airtime queue limits,
 airtime fairness and a driver TXQ scheduler
To: julius@bairaktaris.de
Cc: Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org, 
	ath11k@lists.infradead.org, linux-kernel@vger.kernel.org, jtornosm@redhat.com, 
	baochen.qiang@oss.qualcomm.com, rameshkumar.sundaram@oss.qualcomm.com, 
	toke@toke.dk, sven@narfation.org, john@phrozen.org, 
	tamizh.raja@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"

(In reply to the v5 cover letter,
https://lore.kernel.org/all/20261018174904.1757161-1-julius@bairaktaris.de/
which my mailbox doesn't hold, so this may not thread.)

Hi Julius,

I tested v5 on an Arista C-360 AP: IPQ8074 (AHB) for 2.4 and 5 GHz,
QCN9074 (PCI) for 6 GHz. The base was OpenWrt main with backports 7.2
and the TX flow control v7 patches 1-3 underneath. Flow control
patches 1 and 2 needed fuzz 1 against OpenWrt's IPQ9574 patch; the
rest applied as posted. I swapped the modules in RAM and ran A/B/A
against the unpatched driver.

2.4 GHz, ch 1 20 MHz, two stations downloading TCP for 60 s each:
an 11g-only station (a FastConnect 7800 with HT/VHT/HE off) and a
2x2 HE20 station (BE200). A wired host pinged the 11g station every
0.2 s:

run | 11g Mbit/s | HE20 Mbit/s | ping avg / p95 ms | ping loss
without (A1) | 1.6 | 64.6 | 5275 / 7710 | 4.7%
with v5 | 1.5 | 52.8 | 375 / 769 | 0%
without (A2) | 1.6 | 68.2 | 5415 / 9953 | 6.7%

On the slow station that's the same bufferbloat cure your cover
letter shows. The codel drops land where they should (385 on the 11g
station, 89 on the HE20 one). Its share of the air stayed at about
5%, which matches what you saw about the firmware serving queued
stations in turn.

6 GHz, ch 37 160 MHz, one 2x2 HE station (FastConnect 7800) alone,
TCP download, 4 streams, 60 s:

run | Mbit/s | TCP retx | loaded ping avg / p95 ms
without, run 1 | 1609 | 2928 | 31.7 / 57.6
without, run 2 | 1622 | 2333 | 17.2 / 27.7
with v5 | 1154 | 13100 | 6.5 / 13.3
with v5, fq memory 16 MB | 1340 (*) | 8077 | 10.4 / 24.3
with v5, fq memory 32 MB | 1398 | 2073 | 15.9 / 33.2
(*) steady part only, after a client-side reassociation

The default run's loss wasn't codel: the station showed no drops or
marks. It was fq_overmemory, 409 in the 60 s. mac80211 gives the TXQs
16 MB only when some band has VHT (ieee80211_txq_setup_flows()), and a
6 GHz-only radio has none, so the QCN9074 radio got 4 MB while the
IPQ8074 5 GHz radio got 16 MB. With AQL the backlog moves from the
firmware rings into mac80211, and at 1.4 to 1.6 Gbit/s 4 MB isn't
enough. At 32 MB there were no overmemory drops. What's left (-13%)
seems to be AQL's own cost at 2-stream HE-MCS 9 to 11. The 4 MB cap
looks worth fixing in mac80211 on its own, for any HE radio without
VHT.

I also tried the series with NL80211_EXT_FEATURE_AQL left unset on
the 6 GHz radio only (aql_enable 0 should behave the same). The radio
then ran 1810 to 1906 Mbit/s for seconds at a time, above the 1615
without the series, but it kept overrunning the TX buffer IDR: about
14000 "failed to transmit frame -28" in two runs of 60 s and 45 s,
each burst followed by a dip to 1000 to 1400 Mbit/s.
ath11k_mac_tx_push_txq() checks the TCL ring for room but not the
IDR, so without the airtime limit nothing bounds the frames in
flight. It may be worth ending the round on a full IDR too.

One note on 4/9: tx_duration there is the user's fes_duration_us, and
it's registered in full for each user of the PPDU. For a DL OFDMA or
MU-MIMO PPDU, that charges every station the whole exchange. My
duplicate of this patch (below) divided it by num_users. I didn't
test MU here (OFDMA and MU-MIMO were off).

That duplicate: I sent "wifi: ath11k: feed mac80211's airtime
fairness" on 11-08 without having found your series. It repeats your
1/9 and 4/9, and I've asked Jeff to drop it.

With the series as posted there were no warnings, crashes or
firmware asserts in any run.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.r4-00683 (AP vendor's build)

Tested-by: Christopher Griffin <christophergriffin05@gmail.com>

The tests and this report were done with Claude, an AI coding
assistant.

Christopher
