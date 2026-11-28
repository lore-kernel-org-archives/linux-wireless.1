Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795895854;
	b=Pr2o0FG5wbwSzUtsPzTYqcVaqhHNXsMS26ZcbL5ktuHhmN/jsHJi42FQpntU7zxGcHYt
	 i1GZAJ/6LnlNtR0km4gBW0XyffxZD/U6UnhDutzXDV1cv5LYq/+sUpVpvMyUor9u4pdQ5
	 pwOhxOHzy9TnhWav9p9x2ES7icK+ga+nVQfuXps8Aile01HfUqYqDF0/swpWXeGi86Qau
	 ro6cx1y16CrzzqFIsGjPBwuOAr57g0zgDm5vUtnZiJWtR1D8sJoHDrAnSy6zOgFDaRBAz
	 ZD97JkFltrsqzlRHwTLqARAUCl3YmrqQgXMW6e9In/v5uFAeKxDdMtCuHwVzfaptvsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795895854;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=QY5T8nla22yCBxxLpyhy3s31aQQRIKFRjbr9/PvrNho=;
	b=pXSKa/zishsZi+hEgyDN5hEBJzS0gK7FiOnnC37olA19tMu014ixVtBKXXAg2oWzH5oe
	 o5zxGd85r7kvV8TPGA8GE0QvaS8NOZuF1tEmrurNGpXbWcZtLYhXOHfZTfdbRixO+jPfj
	 zpQ3qUbacO+o3UtSwavhCPSCQTzBPadSlN7fZWiy+h4YS5gbaAQFmRtgJWKPyNkHvEBIn
	 UxoYSGmBOBdKTczvEKe/nWPDi6nbc/MhJy3AI4xp/dB6H+zEgdF+PIMqeAQ8q2K3HsC2u
	 SwwiDskBJhNDwgquz8WzfH1POfqBq6mLMNAn5ECwoAtlzgUdc2LhqMxSFnBKvvd/W+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=XZQT1m1k;
	arc=none smtp.remote-ip=79.135.106.101
Received: from mail-106101.protonmail.ch (mail-106101.protonmail.ch [79.135.106.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835A6606A31C
	for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 19:57:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 835A6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=XZQT1m1k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1795895851; x=1796155051;
	bh=QY5T8nla22yCBxxLpyhy3s31aQQRIKFRjbr9/PvrNho=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=XZQT1m1kJPF+P2ToY7+3hEvvDCV/rBfAwnhKJz83+b2VbU/gviH0RR8WaX11l1dG5
	 +oWpFgX/fmMXIL2QBWFEH26Ji5GgkwLj/t4MBlDqDsy+/IJqZ8NN0FYl/LoZUZC2Jx
	 sv1yY+nZUtsMD1PIqX0Wi6qsK2GU9oydoIvYnPVCpAUX4kL90upyOpw6JQXVV2Nd4Q
	 a+Skmucc6nTj+iLojFq1WPTyTaJQEMdJ1Ju0dPf4cHijBzborRcBFf+xPOtLeFc455
	 gPDVn3HaWQUZqappN/IFhSC6i1pYXPwNchEDPeSxNRn0Ry6P4ynBn0+jrp29bWc/27
	 f5E6NW3LGFlZw==
Date: Sat, 28 Nov 2026 19:57:28 +0000
To: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
From: noliox <noliox@proton.me>
Cc: "pkshih@realtek.com" <pkshih@realtek.com>, "rtl8821cerfe2@gmail.com" <rtl8821cerfe2@gmail.com>
Subject: [REGRESSION?] rtw88_8822bu: severe throughput drops and USB errors in USB 3.0, stable in USB 2.0
Message-ID: <iZ9bP3cARzuiEkrj1I8naGm8zxeaN7YW3iJJKm2OJxA3zZumoHGPXkO8CQHnI6yQsz_FbZrsDu7dPzz0DML7vmuaGZdPDAOQTRg-Wst1Z80=@proton.me>
Feedback-ID: 215756000:user:proton
X-Pm-Message-ID: 3bea83cf047ba9a4b5b69d0df3bca3b3f58be6de
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

Hello,

I would like to report a stability issue with a TP-Link USB Wi-Fi adapter b=
ased on the Realtek RTL8822BU chipset.

**Hardware and software**

- Adapter: TP-Link USB 802.11ac NIC
- USB ID: 2357:0138
- Chipset: Realtek RTL8822BU
- Driver: rtw88_8822bu
- Kernel: 7.3.6-300.fc45.x86_64
- Distribution: Fedora 45
- Firmware: 30.20.0 (H2C version 14)
- USB host connection: USB 3.0, 5000M
- Wi-Fi band during the main throughput tests: 5 GHz

**Problem description**

With the default setting `switch_usb_mode=3DY`, the adapter operates in USB=
 3.0 mode.

Under sustained network load, I observe:

1. Throughput periodically drops dramatically, sometimes almost to zero.
2. During speed tests, throughput starts relatively high and progressively =
decreases.
3. The adapter's activity LED sometimes turns off and remains off while net=
work traffic is stalled.
4. Occasional Wi-Fi disconnections also occur.
5. The problem is observable while connected to a 5 GHz Wi-Fi network.

Kernel logs contain the following messages:

```text
write register 0xc4 failed with -71
rtw_usb_reg_sec: reg 0x4e0, usb write 1 fail, status: -110
failed to get tx report from firmware
deauthenticated ... Reason: 15=3D4WAY_HANDSHAKE_TIMEOUT
```

**Workaround and comparison**

I changed the module parameter at runtime:

```bash
echo N | sudo tee /sys/module/rtw88_usb/parameters/switch_usb_mode
```

After disconnecting and reconnecting the adapter, `lsusb -t` confirms that =
it operates at USB 2.0 speed (480M).

With this setting:

- The activity LED remains active.
- Throughput is substantially more stable.
- Download speed remains around 120 Mbps.
- Upload speed remains around 80 Mbps.
- USB errors `-71` and `-110` have not reappeared during the observation pe=
riod.
- No further TX report timeout messages have been observed during the same =
period.

The improvement has also been observed with a 2.4 GHz connection. In that c=
ase, ping to the local router changed from severe packet loss to 0% packet =
loss after switching to USB 2.0.

**Additional observations**

The adapter generally works in Windows without the problems described above=
. This suggests that the hardware is not necessarily defective, although I =
have not performed a controlled comparison of the Windows and Linux driver =
implementations.

I am aware of a related discussion concerning missing TX reports on RTL8822=
BU devices:

https://lore.kernel.org/linux-wireless/96f122e7-2004-43d6-917d-a07027f568a4=
@gmail.com/

However, my main concern is the USB 3.0 instability under sustained traffic=
, including the USB transport errors and the apparent loss of adapter activ=
ity.

**Questions**

1. Is this a known issue with RTL8822BU USB 3.0 operation in rtw88?
2. Could the USB errors indicate a problem in the rtw88 USB transport handl=
ing, rather than ordinary 2.4 GHz interference?
3. Are there known firmware, xHCI or USB power-management interactions that=
 could explain this behaviour?
4. Would additional tracing or testing be useful to identify the failing pa=
rt of the USB RX/TX path?

I can provide additional kernel logs and test results if needed.

Thank you for your work on the driver.

Best regards

NolioX
