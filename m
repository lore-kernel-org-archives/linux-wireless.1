Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794159345;
	b=40QUmXQ6WtDyFglG1tkH5oHoUuBU6tzW34xbi/b7pfkKATDDB0E1piOaxI68bZHjkgIX
	 QUhXXLvOl40Z4dxgDskO0YTfHahP28oY2S2M+ciCY3csEEy4CCn3PplO9rsw9amQs3q6e
	 E5bVKpD+fMnfW4VrDLACp2YMXWI2+RL+Pxz4L2lAyD7rvhoVMmHlPtZX9hLdYtW+av+zv
	 PaRJfBKevfnPRp7xxxHysDE3tZoOLghfYkDOMKDMPcoCnUj3ApqXnVUaSbdvs4cMFoCZ6
	 Yuo5kWmUQwq++Jib2o0cf6qSACILk8IWUKkH5wPWOgtrC//piVDrIASokyx9FqqO6Xw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794159345;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=7Imt2pxt+An3tB7btBBlikJZRLjk3TSUUB5n+xS4GwU=;
	b=g9EziEHlNLmW0J6cPG5MLcoeBHsWKrU408kAbJXO258ZTWE59Z55hqzc4F5EthTR5CpD
	 XXSBlafXhT8S31CUXFZnhQz7nJo8ZPJ9zjggNPf3AFt/qp0XWf+LpBzyb/nybeje7z8nv
	 iFqzLvFBB9hb8/bs+OlckLVw0Rxku4xgdz8KUZXSWHJg2emMVfyFWcz+bqqFya4bfMn1L
	 uuw007IlOk69ltTKhzli47V4zGhdU6EykeXuxVgmznpuHSYyqcBIYXJbaxYgG1eWH3y4h
	 rNHCXbdy2xYya/F0fYQS+AosbOA3uL+ikMMMQ6RZmJk5F1czPhaws44aKxoMkQyKdVQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PL3SQFH+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.52
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6FE606A31C
	for <linux-wireless@vger.kernel.org>; Sun,  8 Nov 2026 17:35:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC6FE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PL3SQFH+
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-9906a5410f5so228846241.0
        for <linux-wireless@vger.kernel.org>; Sun, 08 Nov 2026 09:35:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794159344; cv=none;
        d=google.com; s=arc-20260327;
        b=NkuWsiZjzUv7XQuyR5sJGTqqFSc8kU7Y6TqzfRxTQSwIlptWGLFUx+0pz0Cod7dAhw
         csT6tvgnt39awXRX3C0R77orx8dWpE4ab/X5mzQ9cYP40W6CZFtS56X7B4nsJh7A2ZCI
         p3EbjTzVRKURPYYOeT3adGoEhNI3DifX+0h0KeNZlrbLQx/9yGAj7xw/7FMpuvcLq6LW
         74Vf0K+AFMGDLfCZ4pf5SZNyYGPM7LH6UnHojO+HvjrnA9ZQqXLjdn10V7BoB+P8l63v
         NZsyrHPCW5xZaJcr3UmbZ7itLGrQdGqMJQSpViANPJ0Nt1eF3wkUv+2oytIlBTipuGhc
         hAHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=7Imt2pxt+An3tB7btBBlikJZRLjk3TSUUB5n+xS4GwU=;
        fh=g4qIvl6/31HtnerxyVK37f4FNVcorEF6JuBH5wiMpis=;
        b=h52/5+NoYQbWQoJU6xIvNsHtqLU0U58yf75Dntq7EWHSAAXkzgKgzftWXFKzMgUcyX
         Pht1NUkSc3woQyWkYk9HLmO0B5CuIqXo2ZBs/zp0YjxlykuPr5cD0v0VRJtHqKoUvsRS
         S3khHf6qgtlQaAgeJBZ+iw5uYSWBoEz9HSbHyui5lXjHtSXqm2Ji0OpdRAt/dGjvsbVy
         twzMRJatspfa3WmRdCmXpXNb4ZZR6vbIsA4V3dd9sTDFY4vvUB6+UCir95s/BPCzKZIb
         y5iO2uUMJR3aKKK7ta1rTCrLxF6xH5T2J/LDRz5UknJgCYODjyxmsY00Nf1eWAX2hX8m
         NuUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794159344; x=1794764144; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7Imt2pxt+An3tB7btBBlikJZRLjk3TSUUB5n+xS4GwU=;
        b=PL3SQFH+b7m0HqQILC+yPZ3Y7f9iJUUe53ldsYvbIkb2sRYaU832j7sTOfVRy9CPDq
         vh+z51SX13JLdoEEIf2ROeS6JTVONdLfkBnHNIvwiXcsjQUUwpsCR4Ro9vcjCY67itav
         /0KAwO6VPbMw6Cj92aew2sHnUrqEOCr/rCm3e6gSludeLRkNz7XoYTZAUEG+R86HCs8W
         JV0gJUkRltpwAL6sqoG4n9LzNk3hkRoxCFYPNEJWTUxFezEFIJrOGUG/TU6Iw12YOQjw
         J922EHyn89qbmGkDYvsjT6fIKaa+EKLQGl7bhadY/yfJ7db7Y00n4py1bZcf4RcJ1i41
         7k9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794159344; x=1794764144;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7Imt2pxt+An3tB7btBBlikJZRLjk3TSUUB5n+xS4GwU=;
        b=EEGjs7FadC18WmCfHSj4/+g4Pn5oFB9PtOzwu/VAEeAQhnej48Lt/Ii34Sv5X2xu3a
         RkjpHBa3AaDbS6sPC8TaDS6CaMwirtYeEREUQLZLViuT3CN/n1S6zUEM8Ucpgo20xu5o
         KgzIiq5f2LhCZQEklpQ8Jvou4/ODHE5bRTCcdnsvu63940QzdCg9JCV6E1+d75MeW4sj
         feccFBbyuJoEpztbFj6kJFkGZ+QKnwee6NuPtnQlkuEkCs/9KK7N6eH2TAzUk4gOzH5H
         TcIm7MEopfnUqn5o4as6j50x4PrfpA6dgUxXFFvDtDI/PBfyI5Rr9kuoV+LDaILh9Ort
         t4Uw==
X-Gm-Message-State: APuU4Z/T5kXs6AHzqMsr6OEWG9LGqLGOX0djhooCQKVGLkyO0i8VOpTD
	wSwCFAE4SG9i/M4UlIW7wAYmE9a/nRYmlES1Z8iicQxHMOFGASv1+o0j6RYnXRqAYUoAQk6LLxw
	s3QONuAVCkDlNN/qRZZLzdBkmZPVHQJ9hy/Zl+dShlolm
X-Gm-Gg: AYBFou11ipdvEoAxgN9bBH88DEuKgR01pPW9kExiGyD2tOo0IGTxseKFBM5AJKS8LDT
	zGdK8+d2J8SoyDUyqlR+nawbR9ibK97ggEs1mJi22wySDZ7fC06XNW2n2cD1W0TK6I1wfKPf5Js
	OgTB8PvrOEKKo/c7ZYBP3ZzGK4KEcZeFB4OsjvtMbCe0GGjIWvtrbbjHZmuH214pz9sWOtKRkh+
	8iz4w75eg5Fmb9sPwfLdFjtYN1hMlmRTg7Zs99O7S9RGE6B8iFMkZUnTX1dPdkIC8Z0lJ1fE3EG
	Uo6QUKu+a2lxd3jfjefpdpMd8Ic2+gwgWOUJbLYTWuPYVYbHTUDLa/yMD/zurfvUS8LbgF1eglk
	paxMp3edQX/ayV1tbyQPM
X-Received: by 2002:a05:6102:3749:b0:7b7:39ec:51d5 with SMTP id
 ada2fe7eead31-7d2bd88d3dfmr955029137.24.1794159343747; Sun, 08 Nov 2026
 09:35:43 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Maximilian <maximilian.rosn1@gmail.com>
Date: Sun, 8 Nov 2026 18:35:32 +0100
X-Gm-Features: AclHuK9tfPWDH5sTvTZMVPCsPXvakGvQTJ9VZgs9n5aBX7-bbnpSX8L3u3qnMGg
Message-ID: <CALgBeJpFSk6oerNscuiagrtkScxC+H0302Khb_G=8GXZx7Ufaw@mail.gmail.com>
Subject: rtw89: 8922ae: any scan drops an MLO connection (local deauth reason
 2, "sec cam entry is empty")
To: pkshih@realtek.com
Cc: linux-wireless@vger.kernel.org
Content-Type: multipart/mixed; boundary="0000000000005aef8a065fc746dc"

--0000000000005aef8a065fc746dc
Content-Type: text/plain; charset="UTF-8"

Hi Ping-Ke,

with an RTL8922AE connected to a Wi-Fi 7 AP via MLO, every scan makes
the station deauthenticate itself (reason 2, PREV_AUTH_NOT_VALID),
followed by "sec cam entry is empty". A single-link connection to the
same AP (2.4 GHz BSS, no MLO) is not affected.

Reproducer (mainline 7.3.3, connected via MLO):

  $ nmcli dev wifi rescan; sleep 5; journalctl -k --since -10s | grep
-E "Reason: 2|sec cam"
  18:29:02.426381 kernel: wlo1: deauthenticating from AP_MLD by local
choice (Reason: 2=PREV_AUTH_NOT_VALID)
  18:29:02.496389 kernel: rtw89_8922ae 0000:03:00.0: sec cam entry is empty

In normal use this happens every 30 s or 300 s: the intervals match
NetworkManager's background scan, which is in the log as

  NetworkManager: Config: added 'bgscan' value 'simple:30:-65:300'

(30 s while the signal is below -65 dBm, 300 s above; the signal was
around -66 to -68 dBm during the 30 s phases.)

Setup
  Machine:        Lenovo IdeaPad Slim 5 16AKP10 (83HY), BIOS R0CN28WW (AMD)
  Card:           RTL8922AE [10ec:8922] rev 01, driver rtw89_8922ae
  Firmware:       0.35.80.3 (8ef4f0cf), linux-firmware
20260319.git217ca6e4.1ubuntu
  Kernel:         7.0.0-43-generic (Ubuntu, 7.0.14)
                  Also reproduced on mainline 7.3.3-070303-generic (Ubuntu
                  mainline build), same firmware: same reason-2 deauth +
                  "sec cam entry is empty" (6 reason-2 drops in 22 min;
                  durations 31, 32, 600, 32, 300, 32 s)
  Userspace:      wpa_supplicant 2.11, NetworkManager 1.54.3
  AP:             AVM FRITZ!Box 5690 Pro, FRITZ!OS 8.25, WPA2/WPA3
mixed (AKM PSK+SAE, MFP capable),
                  CCMP; client NM profile key-mgmt=wpa-psk
                  AP MLD AP_MLD, link 1 = AP_LINK_5G on
                  5520 MHz / 160 MHz (EHT); a separate non-MLO BSS
                  AP_24G_NONMLO on 2462 MHz
  Signal:         -66 to -68 dBm, rx/tx 432-864 Mbit/s EHT

Observations (2026-11-08, ~3 h of logging)
- MLO associations end after 299-302 s (bgscan long interval) or
  30-36 s (short interval) with a locally generated deauth, reason 2.
  25 of 34 reason-2 drops were at ~300 s.
- Each drop is followed within ~80 ms by
  "rtw89_8922ae 0000:03:00.0: sec cam entry is empty" (28 times).
- No rekey or other logged event precedes the deauth; the first
  userspace line is the CTRL-EVENT-DISCONNECTED reason=2
  locally_generated=1 that follows it (bgscan scans are not logged).
- While switching from the non-MLO BSS to the MLO AP during a scan, the
  driver once logged:
  "rtw89_core_scan_complete: cannot find exact bss_conf for link_id 2"
- On reconnect the AP first answers status=30 (assoc rejected temporarily,
  comeback 1000 TU), presumably because it still has the old association.
  Occasionally wpa_supplicant logs "SME: Association request to the
  driver failed" and NetworkManager gives up (supplicant-timeout).
- Single-link connections to AP_24G_NONMLO (2.4 GHz) lasted
  304-615 s without any drop; they only ended when wpa_supplicant
  roamed back to the MLO AP.
- Before the MLO AP was in use (other APs, no MLO, same machine,
  kernel 7.0.0-42/43) there were no reason-2 drops.

Connection durations (from the kernel log):
  MLO    16:11:57    302 s  Reason: 2=PREV_AUTH_NOT_VALID
  MLO    16:17:01    300 s  Reason: 2=PREV_AUTH_NOT_VALID
  MLO    16:22:03     10 s  Reason: 3=DEAUTH_LEAVING
  single 16:22:19     35 s  disconnect from AP AP_24G_NONMLO for new
auth to AP_MLD
  MLO    16:22:55    301 s  Reason: 2=PREV_AUTH_NOT_VALID
  MLO    16:27:59    301 s  Reason: 2=PREV_AUTH_NOT_VALID
  MLO    16:33:02    302 s  Reason: 2=PREV_AUTH_NOT_VALID
  MLO    16:38:06    300 s  Reason: 2=PREV_AUTH_NOT_VALID

One cycle (kernel):
  15:14:43.190304 wlo1: deauthenticating from AP_MLD by local choice
(Reason: 2=PREV_AUTH_NOT_VALID)
  15:14:43.264308 rtw89_8922ae 0000:03:00.0: sec cam entry is empty
  15:14:44.061310 wlo1: authenticate with AP_MLD (local
address=42:07:e5:9e:a4:d3)
  15:14:44.077385 wlo1: authenticated
  15:14:44.159377 wlo1: RX AssocResp from AP_MLD (capab=0x1511 status=30 aid=5)
  15:14:44.159577 wlo1: AP_MLD rejected association temporarily;
comeback duration 1000 TU (1024 ms)
  15:14:45.263328 wlo1: RX AssocResp from AP_MLD (capab=0x1511 status=0 aid=9)
  15:14:45.263479 wlo1: [link 1] local address 42:07:e5:9e:a4:d3, AP
link address AP_LINK_5G (assoc)
  15:14:45.375326 wlo1: associated
  15:19:45.171306 wlo1: deauthenticating from AP_MLD by local choice
(Reason: 2=PREV_AUTH_NOT_VALID)
  15:19:45.247284 rtw89_8922ae 0000:03:00.0: sec cam entry is empty

Userspace around the second drop:
  15:19:45.171306 kernel: wlo1: deauthenticating from AP_MLD by local
choice (Reason: 2=PREV_AUTH_NOT_VALID)
  15:19:45.171704 NetworkManager: device (wlo1): ip:dhcp4: restarting
  15:19:45.247284 kernel: rtw89_8922ae 0000:03:00.0: sec cam entry is empty
  15:19:45.460821 wpa_supplicant: wlo1: CTRL-EVENT-DISCONNECTED
bssid=AP_MLD reason=2 locally_generated=1

The full journal of the 7.3.3 boot (kernel + wpa_supplicant +
NetworkManager, identifiers redacted) is attached. I can also test
patches or enable rtw89 debug_mask - please
tell me which mask you'd like.

Thanks,
Maximilian R.

--0000000000005aef8a065fc746dc
Content-Type: application/x-xz; name="journal-wifi.log.xz"
Content-Disposition: attachment; filename="journal-wifi.log.xz"
Content-Transfer-Encoding: base64
Content-ID: <f_mw844z0h0>
X-Attachment-Id: f_mw844z0h0

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
AARZWg==
--0000000000005aef8a065fc746dc--
