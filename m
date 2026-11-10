Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794293671;
	b=OHxIWwFkzNHOVEKdig319R6YVW7LCrb6ZFiEvTOLo1HRw1b7JvpXyV4bS33Fc2mU14pV
	 NT+ch6tk9x0Oij+Eh25h1DupTAh7eeRfZJEkzB5YbfSOG/qZ8fXTcEqfuJBIcbbDHhCHG
	 PByV8Qhv5GlL9Fq93K11qTwfRThbNHjwrHP6bi7IsSH42c0rMD8miVkfCdf5f8FHcGZQf
	 5uyTzyS61wH24YdZGD/Of0YiYxf6Y1C53x5xVyOqx5UqE8UcKf6ab51zDJ0EzxYSyVkkK
	 S5I9iOu5O/9ClNGUyyf1xJM8jEpSo8hxelTdxCh/ZHFIMgIehWr0monCGK92r7SlNNA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794293671;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=ON76yPiGBPjOcdBUQsWjKqWuzblLf6KyNBqMD0/QiEs=;
	b=GTRPdiGWxRCNqdxa5uwfLlkNH3IeIpJUkE8gUwot9LdHExdBK7IsdSF9FkZpXJqeq73b
	 YwGQ9zaqxbZ/FcKKOdf4fbKSOi41ZTwesyioVRK0asdktYemf/GQ85lPWOyhBDmKhqVhO
	 zdIECCbYqi0tI7n2CHUt1GTUVmb6zGLZwWPMI+TiOTshnqQSEHoAvsFAcbK0KDFOO1Fr2
	 Fvhu5oUvZ0AX2jUaXiC7uuN+wJeA5fef8aLJ3CvEOHCUG3/2cNIG0RsDZtm7/M3V6WgfL
	 F10T3wg97BW3O3T/8hx3xvtRpNujyf885c2BSVSckKi/ZsVCxOPpAm3F6xV2wgEBJHw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="GM/CjpaV";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.50
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B296F606A321
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 06:54:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B296F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GM/CjpaV
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-999b2b06bd7so750848241.0
        for <linux-wireless@vger.kernel.org>; Mon, 09 Nov 2026 22:54:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794293670; cv=none;
        d=google.com; s=arc-20260327;
        b=Hh54yuMCOaWzlCShhbMuyGwjiggbSifeNvm5WGz8Jt9kKWTlrrHWkXjBNX5a80YdhH
         tPelNo3Y50VShlbYwZQfjwK87aAI1oNqBeAJnZBus2Il5MEkC9R513X8eCxFr2qMcGMW
         wdJdRyT+itfjFmlO3EbRMmN7hlg00d6lhk+XwJCPmOhT2elJJTiEMd7Gu2BsyRCkImVj
         13y2akXEQgHTc9OAKZ+4TKMiJKHPxTxTFwEIfJSJHXxO2wcWo+JWZS/pUxYCisBlctd3
         KbYmg0XPlQ1esjZvAtRTwFyBSHBpFDFxQd6mw6Xc8MMBHbPuIGoEV8UXCssMFlPLVqkD
         fGqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ON76yPiGBPjOcdBUQsWjKqWuzblLf6KyNBqMD0/QiEs=;
        fh=ngazwA2NLDQVXN8rDYYh5nlyei9Mrc/9h9ijuZIVOxY=;
        b=MOZxrf/hgWx3X4GMXdaWBt6VHg6huhoN9QxIrwXobVA4Zo8hy9WK4cEqpkPfZFqFyl
         tzMKne1q/e5/mo6FplAJucGBDgSFA35hwhMwboTIVesONM41HhQHHMP5ZYFbfU505t3Q
         KhFlD8VHWePEbCztfMUR4unfVUWRw0TCvRBFCjTkICb6JBEpGqY5tm5aeWpRlPE3pNYT
         JynWwsT3J4unPQpMsNIiyhL6N11a0vv6/HPYxPSfIHHpgXJ42CFw7qsexATEHhGf9B7g
         frwCB2cB5g6232r3MqTRHgOAss6AswYmjuIk3iLj9vX6SaBAH6M3Drryp4CprRmeyAHo
         Fp9Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794293670; x=1794898470; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ON76yPiGBPjOcdBUQsWjKqWuzblLf6KyNBqMD0/QiEs=;
        b=GM/CjpaVtfuD1ObJdYLjwY0R0GDeba42zk8Pes50eUMB6xfh1fnuggF6I/8Flh3OLm
         Vfyfo+kT535gHvmxGLr/4j7D8+e1FFG1tlrh5uCxJpb/Typ1mfaMdJ1K9YNmGSZa7k+o
         ZhbMC/s7o4Hsy0WHZ6s8eQAJzObBaWxYuDWy/7jwNOKppOd1LWJUdzzs5MF12bN6KuQa
         RfXc7dG6y2DwogAnG+k/NN6DOFwRXuK3ecNBenavZIeqNl4XiSWdtxhnRYggLSPsEWbL
         MUiUc0aocJnrd24V5mYih2mRQ1dLzLTFbj6x5H/gUKtT7aKXGdT4oYK+df9SyFDwi/qu
         vnNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794293670; x=1794898470;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ON76yPiGBPjOcdBUQsWjKqWuzblLf6KyNBqMD0/QiEs=;
        b=KYWTmkwQbphCUixvYMHbtzc03q5EK5Vl0kkGHeG0Clyy2oOBeFv6uBez5t3xktIH/o
         oXNSVm2UOKhTeCUGogejPbi26NRUNmW2Titi8SB4bjkf2u7XOYabm/F/WZ6B1EpIYgXW
         R7W4ikr5QRForjRrrYSA5jGoxlXkfQYTPhNf+55TXV8iLYUa+djgDD2izEP7drTlFXHo
         kLJLdG4E2KypUHjkUDcvTqJXH6+UDybLP/NLkT/wYGwOzRd/Y8/5u6XfjNQPA0jJ95r1
         Rd34jM8nVrLOqS4hTdJ/JwLlPRvEjiizHDjvJnUFzv3Z6M6nESVChJ1zJx0IKoTA4Bw+
         F58w==
X-Forwarded-Encrypted: i=1; AL+hErG75tmEdZBtzE46ED6Hv6bb7e9kPOTMWRHbNaG00lcc5YtHjvGYr3jZQoeSStdsi47bz06RDrRM1HqvQHk+Sw==@vger.kernel.org
X-Gm-Message-State: APuU4Z85McsURtlZGKOy1QXqmtutpWaJCywrM611cgd35z9Hrc/yiTS6
	sr4XMGyTHSrR3sJrJlGcV0L9uxIcgQlyWWIct6l80nP9Nq3QX8hS6ysMkXaxKVRii/6UT9G9QNR
	wUUwEUacTCy8B8hsrBVc5j3UV81gyzv4sA2rEJ8Y=
X-Gm-Gg: AYBFou2tEiKPAKPGqJHojm7ZEH+eyeCOvNR7E5HHUCqt+YunWJktdmnRw1KHSvk/jkb
	++yduWBQeQXP1Si+r8XwZPkSmHzckJ7P+58WshMDZZU5OObGxel5VjOmSssJYQd0RPYCjixgM/c
	cYLB65MmZmZM/QKO7Egcb7VVDES/gDsfsal/8bokuQ47tJg4gCvlJRFseM86mSEQYIaLl2YmOJ9
	TKmNLv2vKV0INE4gK5v2eDqWixbRsFyz0auSgSXfalG3n3yWBn9jjb7R0b+btq1N+fzq9sgqOPw
	wPfij6BVt7e2Nxp9heThSESvBuczjnqSzTYhX0sBqkHP7MxnCsNur/420ysRHw+i0MOmwnYoil3
	TsC2qUdWoSYiOX2sppcABFbN30AnRLHUR33Qv/t2QVL+lScJ6cYkzGoZsA0FpG+p3Raw6oWqrz+
	jK9K4nP9FpgpKpNSsy
X-Received: by 2002:a05:6102:579b:b0:7d2:cf82:1a5f with SMTP id
 ada2fe7eead31-7d301c194a3mr577202137.24.1794293669561; Mon, 09 Nov 2026
 22:54:29 -0800 (PST)
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
 <CAKobHXCMdy1YT8SO+kkZP9sCr+KOhOXU+if_r=_hb_5pgKO0mQ@mail.gmail.com>
In-Reply-To: <CAKobHXCMdy1YT8SO+kkZP9sCr+KOhOXU+if_r=_hb_5pgKO0mQ@mail.gmail.com>
From: Christopher Griffin <christophergriffin05@gmail.com>
Date: Tue, 10 Nov 2026 00:54:16 -0600
X-Gm-Features: AclHuK_Xu-_4ngLn3T1h_mV8L2B9Pvc_TLsSCnvFrlmuhuWEjpoBW9WF3FgbfRE
Message-ID: <CAKobHXBhqnB0c2gDEn+so-0AMFg5aj4pv=rEey9mCLHgHy-pBQ@mail.gmail.com>
Subject: Re: ath11k: QCN9074 public firmware stalls at QMI cap request on C-360
To: baochen.qiang@oss.qualcomm.com, rameshkumar.sundaram@oss.qualcomm.com
Cc: jjohnson@kernel.org, ath11k@lists.infradead.org, 
	linux-wireless@vger.kernel.org, vasanthakumar.thiagarajan@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"

Baochen, Rameshkumar,

A direct question on this one, since a month of testing has ruled out
everything on the host side that I can reach.

The board is an Arista C-360: an IPQ8074 host with two PCIe cards,
both 17cb:1104 and both reporting board_id 0xff. One is a 4x4 QCN9074
(6 GHz); the other is 2x2, probably a QCN9072 (2.4/5/6 GHz scan
radio). ath11k from backports 7.2 on Linux 6.18.

No QCN9074 hw1.0 build that Qualcomm has posted boots on it. That is
24 builds now: the 15 in ath11k-firmware (2.5.0.1-01100 through
2.9.0.1-02146; 2.9.0.1-02175 has 02146's amss.bin), on both cards,
and this week the nine under testing/ in quic/upstream-wifi-fw, on
the 2x2 card (2.6.0.1.r6-00010, 2.6.0.1.r7-00002, 2.7.0.1.r1-00003,
2.7.0.1.r2-00005, 2.6.0.1-00828, 2.7.0.1-01701, 2.9.0.1-01385,
-01713, -01832). Two builds that are not in linux-firmware do boot:
the AP vendor's WLAN.HK.2.5.r4-00683, in 2 s, and the
2.15.0.1.r2-00004 from my earlier mail. amss.bin alone decides it:
the vendor's amss.bin boots with any public m3.bin, and a public
amss.bin fails with the vendor's m3.bin.

The failure is always the same, on either card, with the other card
bound or unbound:

MHI SBL -> mission mode, WLFW service connects, indication register,
host capability, memory request (type 1 36700160, type 4 3784704,
type 3 1048576, type 9 8388608, type 10 8192), the host answers in
2 MiB segments, FW_MEM_READY arrives, the host sends the target
capability request, and the firmware never answers it:
"failed to wait qmi cap request: -110". No SYS_ERR, no RDDM, MHI
stays in mission mode.

The same public 2.9.0.1-02146 boots on a QCN9072 on an IPQ6018 host
(an Arista W-318) with a QMI trace that is identical up to that
point, including the segmented memory answer; there the capability
reply comes at once.

So, the questions:

1. Between FW_MEM_READY and the capability reply, what does the
firmware do that can hang on these cards behind an IPQ8074 host? Is
there a known dependency that the 2.5.r4 and 2.15 builds handle and
the posted 0.1 builds do not?

2. What can I capture to show where it sits? I have forced RDDM dumps
of both cards from the stalled state and can send them; tell me if
another log or MHI channel would show more.

3. If the fix exists in a release branch, can a current QCN9074 hw1.0
build from it go into linux-firmware?

I can run any test build on this hardware the day I get it.

Christopher

The tests and this note were prepared with Claude, an AI coding
assistant.
