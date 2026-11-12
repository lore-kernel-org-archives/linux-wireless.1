Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.87
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794520513;
	b=0aJG+m2FznG49khwFd9+vNgGYAgtVOE6sxMg7XGSseLji6c6kO78b7y4NV/1mIGG05jK
	 hjGZwBTmYU6EV0xY2Uo3Xzv5nvlq/sLdVB8tLEfqy2PhSADLZbmmFPlfcZP++trFa1cNU
	 zD3hLXGfXl51R77vij0c6G0wjLyS4EtSQfvrAzRZAYUG0cvu5nCrmPd9518G6uGgGPJ4D
	 TEGIDxTrxRyt0xTdrzrh5d4ksfCLdbO21sgzMlO8xo7EVlQ0JI/7+78z/TsyHz9qh+u+y
	 Ck5kniulV3Zzc5scXhuHTLD0qc3RbvsazuCGHtCQrfM3cJek0T7e/AukLXLK0m8l4+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794520513;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cAIwJJxeuz1biQtNQaAWgjnNY+1Py3EUWw+Z+E4uA40=;
	b=aUPzI/aAxrdL3xE+7Oo7vvFFmigj+9sjPw7CyYnJZCpfryub3l/EdKkOQFLOn1PPERcA
	 f/uouJYiV4frXhK02zVkY4mJduLRfWEh1NB80OcijZmNHY8jBqACP7Be4WFWFJn+khDiF
	 JlpRZUqOiOWFUdC8qZ/bh9pvPmVF3qGYh0OzDOSkBlmZ3HexwZL2//woqgfdE94HXGaOE
	 gXAVP4zQcrbuFm1Sxewi4X4De+xT5ngSBsoEOmSDSiSTJ2mEVD9rnfkSopujbn7Rn5bfP
	 gVWSFvhVm83ntS/1AYkfyRko0b9C6+1eUndmGg2fpBfDpK/XTZKGZTZqEeax5qKmzqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=justthetip.ca;
	spf=pass smtp.mailfrom=justthetip.ca;
	dkim=pass header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=o6c35TmT;
	arc=none smtp.remote-ip=91.218.175.87
Received: from mta0.migadu.com (out-87.mta0.migadu.com [91.218.175.87])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C365606A321
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 21:55:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C365606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=justthetip.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=justthetip.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=o6c35TmT
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=zezGc3eMSrsT2LIUqprixo1HTjLNM/g3ZvrIcC9TmJo=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794520509; v=1; x=1795125309;
 b=o6c35TmTckjinSBytzu6Z0n3Ur4T0lszAVB7p8HxLEzEfMBRnY/Q2dCLt9JYDQUuVW/WpZMm
 3HL7Qqlnm13iE2J4YGaTY47himZk6rs4ERVQAXz5u3alysgwcGfXwLEYz6g7tT4d3sh9gzKtm8c
 /0HmJsjSWlMWfBf2NN53FayY62Klv1Zo2u6Nf4FeWd6XrYk73zBWamQpshPvizpSeahYKjbaDHe
 fxq/NZQfTuSDBOyVYjmg5/q8RL8BJlAjdIMLf/eWHs5DpGSQz+1YYV1lImdqKMqAEO9al6vVBHQ
 lRXdGYESSnbQ1Z+3/9lwo7IDXENlI61HRnwww8puhltlg==
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e2ec1a3cb47568d1;
	Thu, 12 Nov 2026 21:55:07 +0000
X-Mizu-Trace-ID: e2ec1a3cb47568d1
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Alexey Charkov <alchark@flipper.net>
Cc: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] wifi: mt76: mt7921u: Don't reset the USB device on probe
Date: Thu, 12 Nov 2026 14:55:04 -0700
Message-ID: <20261112215504.18199-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261112-mt7921u-bt-reset-v1-1-65587a4d7b81@flipper.net>
References: <20261112-mt7921u-bt-reset-v1-1-65587a4d7b81@flipper.net>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Nov 12, 2026 at 05:39:33PM +0400, Alexey Charkov wrote:
>   Bluetooth: hci0: urb 00000000c4b7b871 failed to resubmit (2)
>   Bluetooth: hci0: Opcode 0x0c03 failed: -110

I get the same timeout on an Alfa AWUS036AXML (MT7921AU, x86) every
time Bluetooth and Wi-Fi probe back to back, and never with the patch:

                                  v7.4-rc1           6.18.52
                                  stock   patched    stock   patched
  Bluetooth reset times out
    port disabled and enabled     5 of 5  0 of 5     5 of 5  0 of 5
    reset and reauthorize         5 of 5  0 of 5     5 of 5  0 of 5
      Wi-Fi interface appears in  8.8 s   1.9 s      8.8 s   1.9 s
    reauthorize at USB 3.0        -       -          5 of 5  0 of 5
  (high-speed USB unless noted)

Both ways put the two probes back to back with the Wi-Fi driver
loaded. Wi-Fi behaves as on stock otherwise, unloading under traffic
included.

> Drop the reset. The USB core resets the port in hub_port_init() before
> addressing any newly connected device, using the same hub_port_reset()
> that usb_reset_device() ends up in, so the probe-time call repeats a
> reset that has just happened. A rebind without re-enumeration resets the
> Wi-Fi subsystem through mt792xu_wfsys_reset() on both disconnect and
> probe.

In the port case the probe finds the Wi-Fi firmware still running (I
logged the ready field). The patched driver comes up from there every
time, and from a cold plug-in at USB 3.0. On stock the field is still
set after the reset.

The second hunk does not apply to 6.18.52, where the probe still takes
a device reference. I dropped only the reset line.

Tested-by: Devin Wittmayer <lucid_duck@justthetip.ca> # Alfa AWUS036AXML
