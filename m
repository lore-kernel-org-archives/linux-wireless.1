Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795209874;
	b=sa0/5RoVnA8Qknb3Ym+091og6wo7GhfLNa60Z0H+T+vMEyNNi+xkOY2teQktpqUhWCvI
	 IE0YZuCNf9yuishRYfXlTS5u7LL77YKv1vEdq/urTWyFJ3o5jRnSXxcmB5vhqp485byYb
	 8guB0ysMogEtVOVB7zdGhFWvjxxaZ1WJgeUGjwEpPxbW6NU6vP6TqMC+ffIUKQs0yNMRX
	 L+xIkbL6EblHIDK4wS2t7LJoIunCYgG+H+oNmkT9XGTLjhQXTZbPVLAzBSL9YYr0Uz953
	 CLy1ejcyhtgigPS/poGF6N+OKo+K3EHCM1yv9uWWBVEVyUF4azYc1a/wwdOFzfb9hlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795209874;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 In-Reply-To:References:Message-ID:Date:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=u8bUyFA7YT2lcTdvO+H/Nub7pWzKQa3TSCcWmE29nrc=;
	b=gka9NXejSspndNXE+dKXuWPbbFfYv/TgwlAP95SvJyDE8Aol7svPoxgzfVieMts7cE55
	 unnWF6fTaoFL7EmwHy0V1waV5eusofXyGxUFk9Cfawuo5kA2ETt8egitDGOqlCItyHBS/
	 Eh0T1H4cvGbeaYlCexMVZAALpMfsBQMGfOssvWECTxrCYzj9xwf/dTVq5oWvrKYUA2RCi
	 +4Cp4QrEdPfBZeXlo/Y/ke/HpXs7Hy1cgnSReaDsGKYn9UKR9kEPYwcsLqDqKIZuuYygq
	 Xnky3/HW48/qQXYp94doUl6qr6iL8/XKw8pp2Zs2MFhStBy1G07znNPI9Pczh4/BcvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=louisremi.com;
	spf=pass smtp.mailfrom=louisremi.com;
	dkim=pass header.d=louisremi-com.20260707.gappssmtp.com header.i=@louisremi-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ENTxBx1A;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4B6606A685
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 21:24:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD4B6606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=louisremi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=louisremi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=louisremi-com.20260707.gappssmtp.com header.i=@louisremi-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ENTxBx1A
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4a34ffd3e39so772612f8f.0
        for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 13:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=louisremi-com.20260707.gappssmtp.com; s=20260707; t=1795209872; x=1795814672; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:date:message-id
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u8bUyFA7YT2lcTdvO+H/Nub7pWzKQa3TSCcWmE29nrc=;
        b=ENTxBx1A66B6DkhmVzvmUkUl/qfG8HcMLTubgU66iiptp6v54x4ZzijRAde1k0ZJdu
         ofu2Z6LFyG3ttX3n9z1r6K2bsGth/uRtu832wWB8RG+DqIwdvkY9fafapH3vAETT4tyJ
         mSgcl7vHenDTxwFwSQzjzeDuT3H3Z7BiDGpJXmF47zi2v/xNaGgSAfKeqVK7IIoj1xnM
         s2TIgClaoUWXRUWeER4HXq25tG7dMK1ULiEJMOZI6ZqXMMJ5ImroGFjvh00iqHwp4xp/
         GrIJ61lsCtaAfYmjMlN2Qqc+95A2Px6h3W1eecGlu/xZlv2Qyh1pJ3OJR1sarA+qMxFu
         lfeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795209872; x=1795814672;
        h=mime-version:content-transfer-encoding:content-type:date:message-id
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u8bUyFA7YT2lcTdvO+H/Nub7pWzKQa3TSCcWmE29nrc=;
        b=jr73k9lM1hoNVqYzYoft1c5ptaNlarZNU1NYEP8r0acjRPJ+TY4kZxG+a1ZR3IAHZV
         C7kpnecEnY9JfoWMCSllefrFaabp63o8k8ZmyMM0gZWDGSMv7sWA5XabSkJSlg7Is4hl
         qT0al10BCEySR1ONHV1rxYvPWslmIcFWTAm7EX6dPKWsMEacDOnXyhJEt319WNSL8ZbE
         zxupzxP6HMRRi2Jeq0bc2sBL2HE/ekQpjV+hbHtFxvA7SdrMqJJCPl9r9pqs0nRgynhK
         9OfzaDiAzpS5JvhTfPU+9gdyToS9GYhnUof5YB73NJGp2v5lO+ooHdf0dcnUQ1cfiisR
         GX0A==
X-Gm-Message-State: APuU4Z/mBnho40VgYDdKAFjKo/KE011xb/QolsvoDtT641A4UcIxDFxw
	n1vmUdNDl+BgYcxJwSu0BOpw4bpBrz9kWp8I+MLdT4Wo9D0U7bha40cHCRGKwNewJ45y1Vm1dQa
	PPXv1whv+fQ==
X-Gm-Gg: AZFdTZc7v824enwTagOVla5jE0LmaA2RoLzmRlNZMp5Bpj2U0PO8DG8gwITgAiyrhum
	pXv/cWMcFbwwEFKdwS7MJo1AsXt5rq4dhkavkoy/COpZaf5Z5O9T3QhSOfrvsZ71vChA+UMjD9Z
	EHc69PCueO/bk0YfVBCCCUz036YN+aQTBKrYHJfYPCjSrH0y+a4EOghAmW0BALGor9ieib/e860
	DM8QvCk7DcO5J3Wf5+kJ7UB7YqFakWPrLho/MyZLuxHri5IlrpSExFPnBX/BBIa0H0gQwV0ss5L
	T9TwLExvtEXeIyVAJvrrq4Z4hjCsD5UfMGW9ko/vZfoCqeOH9/YTGG/jF7gXbX70aPnE0FVFIXa
	RBkwdpUKe5ceKxpw5e33xJCstW0HtIs5qtF74DKWmhOAynbqz8uAexyGVb8hLgr25IQ2bIrFOSB
	cGuWJzwuDchu4ps2E9iEaVJ/o5FBK6wGn/+VRCZfYWg+ZGYo+BqqJ1HIv0CoXEwfkMIWyn+cH8+
	qam/3FlHMRN9VlSn7Y7k9OcYgMO5zflgucL84z8CCWZCY2LsOp3qZxAeDVZgY0ZzcdN73myejvr
	F0qgvhkJ9dPHYHgXmNtKw6ychUwOHrngj7Wbdnkf16UCt4BwbnPCX13l1MB4aYKKBVZkFpHociv
	tuKNLH0SvnEQAx0YoWolsInqNxM6FhlurUGXd4Cn7+2hif6uncq+8Kcx77ApkT9WK4ScAURSFZA
	yetgZXzIw5y9lNyViDrCcN1SMvpH9i3CZ7jfG2Zce8K81VQq9JgDWLc4tkySEZA219B0yue5bd4
	MELfOkVihO1P3wCxjMIU8zjvoZ3v2+77AT27mhpAwP2eAir4baEnJM2b0reL/evV2fbdREkUf2F
	xzl8Axo=
X-Received: by 2002:a05:6000:2b8e:b0:4a4:7dd0:2177 with SMTP id ffacd0b85a97d-4abb55185b5mr5436539f8f.49.1795209871787;
        Fri, 20 Nov 2026 13:24:31 -0800 (PST)
Received: from [172.19.0.4] (rom10-h02-176-169-75-238.dsl.sta.abo.bbox.fr. [176.169.75.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa397asm7610812f8f.48.2026.11.20.13.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 13:24:31 -0800 (PST)
From: =?utf-8?q?Louis-R=C3=A9mi_Bab=C3=A9?= <pro@louisremi.com>
To: linux-wireless@vger.kernel.org
Cc: Yanli Yang <yanli.yang@bedmex.com>,
 Johannes Berg <johannes@sipsolutions.net>, Kalle Valo <kvalo@kernel.org>
Subject: Re: [PATCH wireless-next v5 0/4] wifi: aic: Add AIC8800D80 and D80N
 SDIO FullMAC driver
In-Reply-To: <179481380235.4.7388336477392853157@bedmex.com>
References: <179481380235.4.7388336477392853157@bedmex.com>
Message-ID: <179519070695.4.10313907452014228522@louisremi.com>
Date: Fri, 20 Nov 2026 17:05:06 +0100
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi,

while getting monitor mode working on an AIC8800D80 USB dongle with the
out-of-tree driver this series is based on, I hit a bug in the monitor RX
status handling that also appears in aic8800_fdrv/rwnx_rx.c as added by
3/4 of this series. Reporting it before it lands seems cheaper than fixing
it afterwards.

In rwnx_rxdataind_aicwf():

	if(hw_rxhdr->is_monitor_vif)
		status  = RX_STAT_MONITOR;
	if(hw_rxhdr->flags_upload)
		status |= RX_STAT_FORWARD;

	...

	if (status & RX_STAT_MONITOR) {
		...
		if (status == RX_STAT_MONITOR) {
			...
		} else {
			skb->data = (void *)hw_rxhdr;
			wiphy_err(aicwf_hw->wiphy,
				  "RX status %d is invalid when MON_DATA is disabled\n",
				  status);
			goto check_len_update;
		}

The outer test is a bit test, the inner one is an equality test. A monitor
frame that also carries flags_upload therefore ends up with
RX_STAT_MONITOR | RX_STAT_FORWARD, fails the equality test, and is dropped
with the "RX status ... is invalid when MON_DATA is disabled" message -
even though it is a perfectly valid monitor frame and MON_DATA has nothing
to do with delivering it. With CONFIG_RWNX_MON_DATA=n (the default in the
vendor tree) monitor mode then comes up and silently captures nothing.

In the out-of-tree USB tree the same equality test is worse: that else arm
only has a body under #ifdef CONFIG_RWNX_MON_DATA, so skb_monitor is still
NULL when it is dereferenced a few lines later and the RX thread oopses:

	rwnx_fw_assert_ind: ASSERT (pd != NULL) at rxl_payload_transfer_usb:628
	pc : rwnx_rxdataind_aicwf+0x2a0/0x1dc0 [aic8800_fdrv]
	Code: ... (a94c0001)          /* ldp x1, x0, [x0, #192], x0 = NULL */

followed by a firmware assert and a USB reset.

Making the monitor status win over the forward bit fixes both: a monitor
frame always carries exactly RX_STAT_MONITOR, which is what the rest of the
block already assumes.

	-	if(hw_rxhdr->is_monitor_vif)
	-		status = RX_STAT_MONITOR;
	-
		if(hw_rxhdr->flags_upload)
			status |= RX_STAT_FORWARD;
	+
	+	if(hw_rxhdr->is_monitor_vif)
	+		status = RX_STAT_MONITOR;

(A guard before the dereference is worth having anyway, since
skb_copy_expand() can return NULL there too.)

Tested on the out-of-tree tree: Raspberry Pi 5, kernel 6.18.39, AIC8800D80
USB (368b:8d88), firmware "la Dec 05 2025 19:45:42 - g586bc1e8". Before the
change, monitor mode delivered zero frames on every channel. After it,
tcpdump shows beacons with signal levels on both channels tested
(three nearby APs, -45dBm on ch1 and -50/-64dBm on ch6).

I have not tested the SDIO variant, so I cannot say whether its firmware
ever hits that else arm in practice - if MON_DATA is always enabled there
the drop may be unreachable. The equality test still looks wrong either
way, and the vendor-tree crash shows what happens when it is reachable.

The same finding, with the vendor-tree crash details, is on the radxa
tracker: https://github.com/radxa-pkg/aic8800/issues/39

Happy to send a proper patch against the series if you would prefer that
to a bug report.

Thanks,
