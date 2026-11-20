Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795195316;
	b=WkYT65TuTw/Ebm6FSaAvEnVDgzG1RDkn7zg7F1GKK+lSNJjZGzIFmNhLAdWHvc2aKdFp
	 CnNSvhqKTx4FtrPVCO+1S6eezv6qGBYCI5NUi/mi/k6RES4KnUs9B+8LpOxESsB+bdeRi
	 77AXXox/O6DEeF3FZn5l/T9tcjbmlJDoYStI3AHCYjd/M3ibX0Jyto/L7deUW1y8WvwgH
	 j+AHYUIWvvyLJNwS6uzIHYMowhCl36OvT2Ixr492iLfvWWTtmgj1aUynYqPHTckShKKic
	 wvURO6NbOevCgo2c6CBhvTHLjyWmq3zOSAKNo//cRQSNaLfkl5p08Ev6aPT56hIqxeg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795195316;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=ocV7r3d71aW8u63CLIlM9ojhSm9VlTTepqgkkn93JIw=;
	b=qXBDnrkSvIEtWVmIkggRd1XrMTW0qwosp1UBFtBXHS8sYYK/9oVbo/xEIrlBBTItcf7z
	 St6SR2Du/AD6h1ufwmFO3xtZBzEL3E5UY8pke1+bYVEtNGbVrcdEESbaIeZL0s2xadcX9
	 DJp7EvmXfFxaN4jyKgz1rJutiBKMEIaK6DPCblWsUyr5dqPNpO5kvdIEqgvkNkKocMquG
	 GojWdMAPGctMEiNmc8yIqjc3gvVVbr07L7uN0l4QZY0KHbOB6jlyzPIKU3xgH5DDyiLYV
	 ZSiuldRuL2dKo1BmGxtqj+yqltrr09hmqRKVqJM6hQ7MhRlBFALKGEccC+Jr1OfjOSw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=berkeley.edu;
	spf=pass smtp.mailfrom=berkeley.edu;
	dkim=pass header.d=berkeley.edu header.i=@berkeley.edu header.a=rsa-sha256 header.s=google header.b=fVWXQdtp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F950606A744
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 17:21:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F950606A744
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.a=rsa-sha256 header.s=google header.b=fVWXQdtp
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b0bbdeae06so708008a91.1
        for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 09:21:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795195314; cv=none;
        d=google.com; s=arc-20260327;
        b=DolxeoaR1T0z5UfD6FChhjt7C52lC8wBtXKv41u+iOEzMBDwJLQZ6YZ2msomCDgXzv
         AAjBa8/ozipQ5fDm/FdVDhegJec40lfxZEu24qc9FypnkLW9/p9ismCdnXjwdE2wQCr2
         1XwmEtjKFrHd/54FZ7bOCerepg2uKzh7buRhwsQUZL0oCBj8Otcu4AiAv+dxF2NkOJsg
         14bugWP0kAeh4rZmB1nDdfcxGj9Fa3+JFOjBTWjLeSSP1eMIS8Eu9gcJBvr94LqBjv8I
         5tmGFAhngDFydMpDKooyAI7cTisQkbeQdetGQYhMyqMDecQ70M4AQF53mgsPbRDlhBRp
         fiRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ocV7r3d71aW8u63CLIlM9ojhSm9VlTTepqgkkn93JIw=;
        fh=ok3CmlHesdpAFfnPCZNltLId+K7/K1ZgkjepYaS7dcE=;
        b=NGbEGu0POQ2jUbHnvy/j9CsU7e0sQbed/ez6BoiyzS7ToKV+Fh0osPG9Ms8/rN7EHJ
         +vFUAb2CFNGh6u5MvW8iTl0oyE4hDUd80DLXuUzQI6PXMZGYe1CsV1hRLYKQtwO6Nc5u
         blr5jn9zTfwnbLduhNbfG/6ufKDAyl0m9ffBD2qiu19E12CRomjej6wblJXR2lzjLxsS
         +5KKkgWI3/mKbRcLLq/2e4jqCfF8aSI8sQ15dGaNGIEjK/TiBLEUtXAD/LgCa0rlV9Dk
         L80eCT9Hmk3sgipajh2vMYG+FMdMxAn+lYPKLWTEYwhK/pFBlYB1UUNHxwMRu1Q8BKWG
         x9Gg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1795195314; x=1795800114; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ocV7r3d71aW8u63CLIlM9ojhSm9VlTTepqgkkn93JIw=;
        b=fVWXQdtpSoHeBn+Rd60dFQt5iZxu3XuPgXn/OjxT3fgV6Fix6QEyaQQFeHdl9EOYDy
         fqlLMuyHX7XgpM5JG48mvZCtzrVmrmU1rOLdEPSrYI2FwcADO4anVGQG7nAOc7n2JKnM
         GGgXDsbQ+K/iu+XW7xc+MSF1G1wd4hyMpXn1MDKaTUHZrrRpRn8ld9titdEPOsG0BWzq
         4kaykeFde7iP7dbxMtWC/lRS64FCAaGy6AYO79cfNwi8qJd10jeAFBFXQ1iPiDNBDyOw
         zDRXA1G6FYuNjqyzB04lxk2vzsaTlrinEPjMjma7MNHDoBlfsjAGMqzeay7BqSp05T/F
         fMCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795195314; x=1795800114;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ocV7r3d71aW8u63CLIlM9ojhSm9VlTTepqgkkn93JIw=;
        b=EuM9HBN1GGIzTu6OUixtNkkmauR27XyczYkMNITkOGFgIhnne5I8mgkR6i968mp7PX
         +r9jPR2vymjp2EbbqT1h/Wr8EBpkHya+mESRZ5v18R6FL8tQWgKtNq005pXRkiWK0Rh1
         +uatl1xQJ8ymVzXiiqtDKevvdOq+ix5jWpyS+LeNcbMi8RUfn6TU3hAjqbdrCHRKy25H
         WnGOrnMJKcW9t1Js/1SZPDjiNGhL04f4HjldlBGxkURj3TqrQvVJpZO1JTR1nBzhzrCk
         iRTE546N5MuGRB7y9CYbTHpayNVJIHsBBri95E8ApJL1GukVWPP2WXHpotZ9xQJKDZCx
         iB/g==
X-Forwarded-Encrypted: i=1; AL+hErHon60YI0YPbEMcZJT53wTfUIHMh28MlbURZJLNYVa59civCgdwfUSlSPX2DhZ+qfDQVPoN+KTZOEd4PKMiYw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+CFXrUbTP3LUwXH5Qiyai6aUzubAUTBcDUOVRPnvaPd3Ocsj2C
	kMO2cdbvdozxxRqv8nRZZszX0UBlsbzICw9AGsI6lI+7YcbfvlvznHxoZlyQIQGXRWqL4pgayQi
	B5UAVLSKtxJQMooYaR5WYYCheFmUcdy35uws+sVs3
X-Gm-Gg: AZFdTZfdT/3bE3034b5aZaLN+2YAzMP5YNN9y9g79DQdrdDtLX1ydTtzCFT4jEkZuXJ
	2YD8/SauKHqIH5VJWV1USop4YOKYfcnH1mYJPtwVrKX3FSYILYtyxA8ge5Oy01UWY17zkUaXv/Y
	n++NH7M7q3ZPw4B7eVXGrxB/hAQo8u6R71tGksjcyeMBfjhGcpGvJ392NDCtlzldyHKbnZ+eMyt
	D3Q2a9ExTK+SrNAnZ8JQ2jXl1cIg4BxMny3xooDr1SkXh6k9sS2t76JXTPWTxMSc1Hay0O883Q3
	RE5nRDtcq0+EQkr+CIpZ9t158CYRkku3+ltKjoDUOEujAcTao9WNpFZ5BnSF92Rd/ndBSORzcXc
	56+DwLK1N4hePVaHvbrXvJvowoz299Iq+q6pFTqvPppEiu6t8rpzW6phj5XNk5b54qB4s5XIm2S
	2b7BcvOQwdmqTzKcHaosGT
X-Received: by 2002:a17:90b:39a7:b0:3ac:8897:7baa with SMTP id
 98e67ed59e1d1-3b41c9638b9mr3150447a91.40.1795195313192; Fri, 20 Nov 2026
 09:21:53 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CA+0ovCgiXX28Mdyu5xA4mDU2pPwoByEzEKgLn5JnfapEKg+PmA@mail.gmail.com>
 <20261109103444.381459-2-ca@modelmiser.com>
In-Reply-To: <20261109103444.381459-2-ca@modelmiser.com>
From: Farhad Alemi <farhad.alemi@berkeley.edu>
Date: Fri, 20 Nov 2026 10:21:40 -0700
X-Gm-Features: AclHuK8FzoUBSo7ldxLWlf_r7gzagPKqTCOowOMxAGYfKY1Y_w_7T7nBj4kkDFs
Message-ID: <CA+0ovCgukr_PwQ89iC+YW6FC-m==na4iW6fUkiCM5xp09PMt-Q@mail.gmail.com>
Subject: Re: [BUG] ath9k_htc_tx_cleanup_timer -- ODEBUG free-active-timer and
 use-after-free on USB unplug
To: Chad Aldreda <ca@modelmiser.com>
Cc: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@toke.dk>, 
	Jeff Johnson <jjohnson@kernel.org>, falemi@asu.edu, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000f346b80660b87a58"

--000000000000f346b80660b87a58
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Chad,

Attaching the reproducer;
Here's what I've on my end:
Linux version 7.4.0-rc3-00406-g65e4fd942f72 _ UpstreamAppArmorKASAN.config

[   47.094450][ T5080] ODEBUG: free active (active state 0) object:
ffff8880232eb9d8 object type: timer_list hint:
ath9k_htc_tx_cleanup_timer+0x0/0x4d0
[   47.094484][ T5080] WARNING: lib/debugobjects.c:632 at
debug_print_object+0xec/0x230, CPU#1: kworker/1:3/5080
[   47.097170][ T5080] Modules linked in:
[   47.097553][ T5080] CPU: 1 UID: 0 PID: 5080 Comm: kworker/1:3 Not
tainted 7.4.0-rc3-00406-g65e4fd942f72 #1 PREEMPT(full)
[   47.098571][ T5080] Hardware name: QEMU Standard PC (Q35 + ICH9,
2009), BIOS 1.17.0-debian-1.17.0-1ubuntu1 04/01/2014
[   47.099555][ T5080] Workqueue: usb_hub_wq hub_event
[   47.100033][ T5080] RIP: 0010:debug_print_object+0x18a/0x230
[   47.100612][ T5080] Code: f8 48 c1 e8 03 80 3c 18 00 74 08 4c 89 ff
e8 dd 00 5d fd 4d 8b 0f 4c 89 ef 48 8b 74 24 08 48 89 ea 44 89 e1 4d
89 f0 ff 34 24 <67> 48 0f b9 3a 48 83 c4 08 ff 05 b3 e5 94 0b 48 83 c4
10 5b 41 5c
[   47.102516][ T5080] RSP: 0000:ffffc900073d71b0 EFLAGS: 00010246
[   47.103077][ T5080] RAX: 1ffffffff181f204 RBX: dffffc0000000000
RCX: 0000000000000000
[   47.103805][ T5080] RDX: ffffffff8c6d6240 RSI: ffffffff8c6d5cc0
RDI: ffffffff908259e0
[   47.104535][ T5080] RBP: ffffffff8c6d6240 R08: ffff8880232eb9d8
R09: ffffffff8c0fa380
[   47.105261][ T5080] R10: dffffc0000000000 R11: ffffffff81b485d0
R12: 0000000000000000
[   47.105997][ T5080] R13: ffffffff908259e0 R14: ffff8880232eb9d8
R15: ffffffff8c0f9020
[   47.106726][ T5080] FS:  0000000000000000(0000)
GS:ffff8881da31c000(0000) knlGS:0000000000000000
[   47.107542][ T5080] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   47.108148][ T5080] CR2: 0000555c9014c710 CR3: 000000010adc9000
CR4: 0000000000752ef0
[   47.108880][ T5080] PKRU: 55555554
[   47.109216][ T5080] Call Trace:
[   47.109538][ T5080]  <TASK>
[   47.109818][ T5080]  ? __pfx_ath9k_htc_tx_cleanup_timer+0x10/0x10
[   47.110436][    C1]
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[   47.111264][    C1] BUG: KASAN: slab-use-after-free in
_raw_spin_lock+0x2e/0x40
[   47.111997][    C1] Read of size 1 at addr ffff888023b881c0 by task
kworker/1:3/5080
[   47.112746][    C1]
[   47.112978][    C1] CPU: 1 UID: 0 PID: 5080 Comm: kworker/1:3 Not
tainted 7.4.0-rc3-00406-g65e4fd942f72 #1 PREEMPT(full)
[   47.113987][    C1] Hardware name: QEMU Standard PC (Q35 + ICH9,
2009), BIOS 1.17.0-debian-1.17.0-1ubuntu1 04/01/2014
[   47.114961][    C1] Workqueue: usb_hub_wq hub_event
[   47.115437][    C1] Call Trace:
[   47.115748][    C1]  <IRQ>
[   47.116019][    C1]  dump_stack_lvl+0xe8/0x150
[   47.116456][    C1]  print_address_description+0x55/0x1e0
[   47.116968][    C1]  ? _raw_spin_lock+0x2e/0x40
[   47.117409][    C1]  print_report+0x58/0x70
[   47.117815][    C1]  kasan_report+0x117/0x150
[   47.118239][    C1]  ? _raw_spin_lock+0x2e/0x40
[   47.118682][    C1]  __kasan_check_byte+0x2a/0x40
[   47.119137][    C1]  lock_acquire+0x7d/0x350
[   47.119565][    C1]  ? lock_acquire+0x115/0x350
[   47.120008][    C1]  _raw_spin_lock+0x2e/0x40
[   47.120435][    C1]  ? ath9k_htc_tx_cleanup_timer+0x57/0x4d0
[   47.120976][    C1]  ath9k_htc_tx_cleanup_timer+0x57/0x4d0
[   47.121608][    C1]  call_timer_fn+0x18d/0x5f0
[   47.122065][    C1]  ? __pfx_ath9k_htc_tx_cleanup_timer+0x10/0x10
[   47.122672][    C1]  ? call_timer_fn+0xd5/0x5f0
[   47.123110][    C1]  ? __pfx_call_timer_fn+0x10/0x10
[   47.123592][    C1]  ? _raw_spin_unlock_irq+0x23/0x50
[   47.124075][    C1]  ? __pfx_ath9k_htc_tx_cleanup_timer+0x10/0x10
[   47.124657][    C1]  __run_timer_base+0x652/0x8b0
[   47.125109][    C1]  ? lock_acquire+0x115/0x350
[   47.125555][    C1]  ? __pfx___run_timer_base+0x10/0x10
[   47.126054][    C1]  run_timer_softirq+0xb7/0x170
[   47.126510][    C1]  handle_softirqs+0x26a/0x8d0
[   47.126961][    C1]  __irq_exit_rcu+0xc6/0x220
[   47.127398][    C1]  irq_exit_rcu+0x9/0x30
[   47.127797][    C1]  sysvec_apic_timer_interrupt+0xa6/0xc0
[   47.128317][    C1]  </IRQ>
[   47.128597][    C1]  <TASK>
[   47.128876][    C1]  asm_sysvec_apic_timer_interrupt+0x1a/0x20
[   47.129438][    C1] RIP: 0010:__nbcon_atomic_flush_pending_con+0x261/0x3=
70
[   47.130087][    C1] Code: 00 02 00 00 75 41 e8 1e 1f 21 00 4d 85 ed
4c 8d 7c 24 40 75 0c e8 0f 1f 21 00 45 84 e4 75 0d eb 3b e8 03 1f 21
00 fb 45 84 e4 <74> 30 f6 44 24 50 02 49 bc 00 00 00 00 00 fc ff df 74
34 e8 e7 1e
[   47.131969][    C1] RSP: 0000:ffffc900073d6a80 EFLAGS: 00000202
[   47.132565][    C1] RAX: ffffffff81a7a58d RBX: 0000000000000949
RCX: ffff8881072b2640
[   47.133290][    C1] RDX: 0000000000000000 RSI: 0000000000000000
RDI: 0000000000000000
[   47.134020][    C1] RBP: ffffc900073d6b70 R08: ffffffff9077587f
R09: 1ffffffff20eeb0f
[   47.134749][    C1] R10: dffffc0000000000 R11: fffffbfff20eeb10
R12: dffffc0000000001
[   47.135480][    C1] R13: 0000000000000200 R14: ffffffff8f66d568
R15: ffffc900073d6ac0
[   47.136203][    C1]  ? __nbcon_atomic_flush_pending_con+0x25d/0x370
[   47.136808][    C1]  ? __pfx___nbcon_atomic_flush_pending_con+0x10/0x10
[   47.137439][    C1]  __nbcon_atomic_flush_pending+0x248/0x450
[   47.137991][    C1]  ? __pfx___nbcon_atomic_flush_pending+0x10/0x10
[   47.138591][    C1]  ? panic_on_this_cpu+0x32/0x40
[   47.139053][    C1]  vprintk_emit+0x1a6/0x5f0
[   47.139481][    C1]  ? __pfx_vprintk_emit+0x10/0x10
[   47.139950][    C1]  ? unwind_next_frame+0xa6/0x2550
[   47.140438][    C1]  _printk+0xdd/0x130
[   47.140816][    C1]  ? __pfx_ath9k_htc_tx_cleanup_timer+0x10/0x10
[   47.141499][    C1]  ? __pfx__printk+0x10/0x10
[   47.141956][    C1]  ? unwind_next_frame+0xa6/0x2550
[   47.142471][    C1]  ? get_stack_info_noinstr+0x1b/0x130
[   47.142979][    C1]  ? wq_watchdog_touch+0x100/0x160
[   47.143464][    C1]  ? __pfx_ath9k_htc_tx_cleanup_timer+0x10/0x10
[   47.144044][    C1]  ? __pfx_ath9k_htc_tx_cleanup_timer+0x10/0x10
[   47.144623][    C1]  __show_trace_log_lvl+0x44d/0x550
[   47.145108][    C1]  ? debug_check_no_obj_freed+0x3a2/0x470
[   47.145640][    C1]  __warn+0x181/0x4c0
[   47.146015][    C1]  ? debug_print_object+0xec/0x230
[   47.146493][    C1]  ? debug_print_object+0xec/0x230
[   47.146972][    C1]  __report_bug+0x273/0x580
[   47.147402][    C1]  ? debug_print_object+0xec/0x230
[   47.147878][    C1]  ? __pfx___report_bug+0x10/0x10
[   47.148347][    C1]  ? ret_from_fork_asm+0x1a/0x30
[   47.148815][    C1]  report_bug_entry+0x19b/0x290
[   47.149270][    C1]  ? debug_print_object+0x18a/0x230
[   47.149757][    C1]  ? debug_print_object+0x18f/0x230
[   47.150240][    C1]  handle_bug+0xce/0x200
[   47.150645][    C1]  exc_invalid_op+0x1a/0x50
[   47.151142][    C1]  asm_exc_invalid_op+0x1a/0x20
[   47.151623][    C1] RIP: 0010:debug_print_object+0x18a/0x230
[   47.152195][    C1] Code: f8 48 c1 e8 03 80 3c 18 00 74 08 4c 89 ff
e8 dd 00 5d fd 4d 8b 0f 4c 89 ef 48 8b 74 24 08 48 89 ea 44 89 e1 4d
89 f0 ff 34 24 <67> 48 0f b9 3a 48 83 c4 08 ff 05 b3 e5 94 0b 48 83 c4
10 5b 41 5c
[   47.153971][    C1] RSP: 0000:ffffc900073d71b0 EFLAGS: 00010246
[   47.154538][    C1] RAX: 1ffffffff181f204 RBX: dffffc0000000000
RCX: 0000000000000000
[   47.155263][    C1] RDX: ffffffff8c6d6240 RSI: ffffffff8c6d5cc0
RDI: ffffffff908259e0
[   47.155993][    C1] RBP: ffffffff8c6d6240 R08: ffff8880232eb9d8
R09: ffffffff8c0fa380
[   47.156722][    C1] R10: dffffc0000000000 R11: ffffffff81b485d0
R12: 0000000000000000
[   47.157495][    C1] R13: ffffffff908259e0 R14: ffff8880232eb9d8
R15: ffffffff8c0f9020
[   47.158262][    C1]  ? __pfx_timer_debug_hint+0x10/0x10
[   47.158795][    C1]  ? __pfx_ath9k_htc_tx_cleanup_timer+0x10/0x10
[   47.159374][    C1]  ? __pfx_ath9k_htc_tx_cleanup_timer+0x10/0x10
[   47.159957][    C1]  debug_check_no_obj_freed+0x3a2/0x470
[   47.160476][    C1]  __free_frozen_pages+0x5ae/0xe20
[   47.160957][    C1]  ? __pfx_wiphy_dev_release+0x10/0x10
[   47.161576][    C1]  device_release+0xc4/0x1f0
[   47.162037][    C1]  kobject_put+0x228/0x560
[   47.162486][    C1]  ath9k_hif_usb_disconnect+0x135/0x240
[   47.163035][    C1]  usb_unbind_interface+0x26e/0x8f0
[   47.163527][    C1]  ? kernfs_remove_by_name_ns+0x101/0x140
[   47.164055][    C1]  ? __pfx_usb_unbind_interface+0x10/0x10
[   47.164589][    C1]  device_release_driver_internal+0x4d9/0x870
[   47.165154][    C1]  bus_remove_device+0x455/0x570
[   47.165623][    C1]  ? __pfx_bus_remove_device+0x10/0x10
[   47.166127][    C1]  ? kernfs_remove_by_name_ns+0x101/0x140
[   47.166661][    C1]  device_del+0x527/0x8f0
[   47.167070][    C1]  ? __pfx_device_del+0x10/0x10
[   47.167528][    C1]  ? kobject_put+0x51d/0x560
[   47.167963][    C1]  usb_disable_device+0x3d4/0x8d0
[   47.168439][    C1]  usb_disconnect+0x32f/0x990
[   47.168879][    C1]  hub_event+0x1cc9/0x4f30
[   47.169303][    C1]  ? __pfx_hub_event+0x10/0x10
[   47.169756][    C1]  ? process_scheduled_works+0x94e/0x1900
[   47.170284][    C1]  ? process_scheduled_works+0x94e/0x1900
[   47.170816][    C1]  ? process_scheduled_works+0x94e/0x1900
[   47.171453][    C1]  process_scheduled_works+0xc99/0x1900
[   47.172001][    C1]  ? __pfx_process_scheduled_works+0x10/0x10
[   47.172589][    C1]  ? assign_work+0x3d5/0x5e0
[   47.173021][    C1]  worker_thread+0xa53/0xfc0
[   47.173460][    C1]  kthread+0x38b/0x480
[   47.173844][    C1]  ? __pfx_worker_thread+0x10/0x10
[   47.174351][    C1]  ? __pfx_kthread+0x10/0x10
[   47.174810][    C1]  ret_from_fork+0x514/0xb70
[   47.175273][    C1]  ? __pfx_ret_from_fork+0x10/0x10
[   47.175784][    C1]  ? __switch_to+0xc68/0x1400
[   47.176224][    C1]  ? __pfx_kthread+0x10/0x10
[   47.176662][    C1]  ret_from_fork_asm+0x1a/0x30
[   47.177113][    C1]  </TASK>
[   47.177406][    C1]
[   47.177633][    C1] Allocated by task 10:
[   47.178018][    C1]  kasan_save_track+0x3f/0x90
[   47.178464][    C1]  __kasan_kmalloc+0x93/0xb0
[   47.178894][    C1]  __kmalloc_cache_noprof+0x320/0x610
[   47.179395][    C1]  ath9k_init_wmi+0x4f/0x2b0
[   47.179825][    C1]  ath9k_htc_probe_device+0x1e8/0x2340
[   47.180328][    C1]  ath9k_htc_hw_init+0x32/0x70
[   47.180774][    C1]  ath9k_hif_usb_firmware_cb+0x217/0x4b0
[   47.181394][    C1]  request_firmware_work_func+0x103/0x2e0
[   47.181952][    C1]  process_scheduled_works+0xc99/0x1900
[   47.182497][    C1]  worker_thread+0xa53/0xfc0
[   47.182928][    C1]  kthread+0x38b/0x480
[   47.183311][    C1]  ret_from_fork+0x514/0xb70
[   47.183747][    C1]  ret_from_fork_asm+0x1a/0x30
[   47.184194][    C1]
[   47.184422][    C1] Freed by task 5080:
[   47.184794][    C1]  kasan_save_track+0x3f/0x90
[   47.185234][    C1]  kasan_save_free_info+0x46/0x50
[   47.185708][    C1]  __kasan_slab_free+0x70/0x90
[   47.186156][    C1]  kfree+0x1c7/0x650
[   47.186527][    C1]  ath9k_htc_disconnect_device+0x205/0x270
[   47.187064][    C1]  ath9k_hif_usb_disconnect+0x135/0x240
[   47.187577][    C1]  usb_unbind_interface+0x26e/0x8f0
[   47.188062][    C1]  device_release_driver_internal+0x4d9/0x870
[   47.188627][    C1]  bus_remove_device+0x455/0x570
[   47.189086][    C1]  device_del+0x527/0x8f0
[   47.189493][    C1]  usb_disable_device+0x3d4/0x8d0
[   47.189960][    C1]  usb_disconnect+0x32f/0x990
[   47.190400][    C1]  hub_event+0x1cc9/0x4f30
[   47.190818][    C1]  process_scheduled_works+0xc99/0x1900
[   47.191428][    C1]  worker_thread+0xa53/0xfc0
[   47.191881][    C1]  kthread+0x38b/0x480
[   47.192282][    C1]  ret_from_fork+0x514/0xb70
[   47.192731][    C1]  ret_from_fork_asm+0x1a/0x30
[   47.193177][    C1]
[   47.193407][    C1] The buggy address belongs to the object at
ffff888023b88000
[   47.193407][    C1]  which belongs to the cache kmalloc-2k of size 2048
[   47.194668][    C1] The buggy address is located 448 bytes inside of
[   47.194668][    C1]  freed 2048-byte region [ffff888023b88000,
ffff888023b88800)
[   47.195918][    C1]
[   47.196143][    C1] The buggy address belongs to the physical page:
[   47.196738][    C1] page: refcount:0 mapcount:0
mapping:0000000000000000 index:0x0 pfn:0x23b88
[   47.197545][    C1] head: order:3 mapcount:0 entire_mapcount:0
nr_pages_mapped:0 pincount:0
[   47.198315][    C1] flags:
0xfff00000000040(head|node=3D0|zone=3D1|lastcpupid=3D0x7ff)
[   47.199011][    C1] page_type: f5(slab)
[   47.199389][    C1] raw: 00fff00000000040 ffff88801b042000
dead000000000100 dead000000000122
[   47.200168][    C1] raw: 0000000000000000 0000000000080008
00000000f5000000 0000000000000000
[   47.200951][    C1] head: 00fff00000000040 ffff88801b042000
dead000000000100 dead000000000122
[   47.201860][    C1] head: 0000000000000000 0000000000080008
00000000f5000000 0000000000000000
[   47.202691][    C1] head: 00fff00000000003 fffffffffffffe01
00000000ffffffff 00000000ffffffff
[   47.203484][    C1] head: ffffffffffffffff 0000000000000000
00000000ffffffff 0000000000000008
[   47.204268][    C1] page dumped because: kasan: bad access detected
[   47.204860][    C1] page_owner tracks the page as allocated
[   47.205386][    C1] page last allocated via order 3, migratetype
Unmovable, gfp_mask
0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEM=
ALLOC),
pid 9342, tgid 9342 (dhcpcd), ts 33901338557
[   47.207091][    C1]  post_alloc_hook+0x1f9/0x250
[   47.207542][    C1]  prep_new_page+0x22/0xc0
[   47.207960][    C1]  get_page_from_freelist+0x240b/0x2450
[   47.208477][    C1]  __alloc_frozen_pages_noprof+0x211/0x450
[   47.209018][    C1]  allocate_slab+0x7d/0x5e0
[   47.209445][    C1]  refill_objects+0x2d6/0x350
[   47.209886][    C1]  __pcs_replace_empty_main+0x2c9/0x6c0
[   47.210400][    C1]  __kmalloc_node_track_caller_noprof+0x54d/0x720
[   47.210991][    C1]  __alloc_skb+0x2c5/0x7d0
[   47.211517][    C1]  rtmsg_ifinfo_build_skb+0x84/0x260
[   47.212033][    C1]  rtmsg_ifinfo+0x8c/0x1a0
[   47.212481][    C1]  register_netdevice+0x1ded/0x22a0
[   47.212967][    C1]  lapbeth_new_device+0x30c/0x570
[   47.213441][    C1]  lapbeth_device_event+0x329/0x460
[   47.213924][    C1]  notifier_call_chain+0x1ad/0x3d0
[   47.214403][    C1]  __dev_notify_flags+0x318/0x500
[   47.214872][    C1] page last free pid 11 tgid 11 ts 32751360683 stack t=
race:
[   47.215544][    C1]  free_pages_prepare+0xa03/0xb00
[   47.216012][    C1]  __free_contig_range_common+0x174/0x340
[   47.216539][    C1]  free_pages_bulk+0x48/0x120
[   47.216978][    C1]  vfree+0x22c/0x470
[   47.217345][    C1]  delayed_vfree_work+0x55/0x80
[   47.217801][    C1]  process_scheduled_works+0xc99/0x1900
[   47.218315][    C1]  worker_thread+0xa53/0xfc0
[   47.218750][    C1]  kthread+0x38b/0x480
[   47.219134][    C1]  ret_from_fork+0x514/0xb70
[   47.219570][    C1]  ret_from_fork_asm+0x1a/0x30
[   47.220019][    C1]
[   47.220244][    C1] Memory state around the buggy address:
[   47.220765][    C1]  ffff888023b88080: fb fb fb fb fb fb fb fb fb
fb fb fb fb fb fb fb
[   47.221609][    C1]  ffff888023b88100: fb fb fb fb fb fb fb fb fb
fb fb fb fb fb fb fb
[   47.222390][    C1] >ffff888023b88180: fb fb fb fb fb fb fb fb fb
fb fb fb fb fb fb fb
[   47.223118][    C1]                                            ^
[   47.223687][    C1]  ffff888023b88200: fb fb fb fb fb fb fb fb fb
fb fb fb fb fb fb fb
[   47.224418][    C1]  ffff888023b88280: fb fb fb fb fb fb fb fb fb
fb fb fb fb fb fb fb
[   47.225150][    C1]
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[   47.225920][    C1] Kernel panic - not syncing: KASAN: panic_on_warn set=
 ...
[   47.226593][    C1] CPU: 1 UID: 0 PID: 5080 Comm: kworker/1:3 Not
tainted 7.4.0-rc3-00406-g65e4fd942f72 #1 PREEMPT(full)
[   47.227865][    C1] Hardware name: QEMU Standard PC (Q35 + ICH9,
2009), BIOS 1.17.0-debian-1.17.0-1ubuntu1 04/01/2014
[   47.228884][    C1] Workqueue: usb_hub_wq hub_event
[   47.229379][    C1] Call Trace:
[   47.229712][    C1]  <IRQ>
[   47.229995][    C1]  vpanic+0x26f/0x710
[   47.230396][    C1]  panic+0xc5/0xd0
[   47.230768][    C1]  ? __pfx_panic+0x10/0x10
[   47.231246][    C1]  ? _raw_spin_lock+0x2e/0x40
[   47.231713][    C1]  ? _raw_spin_lock+0x2e/0x40
[   47.232173][    C1]  check_panic_on_warn+0x89/0xb0
[   47.232667][    C1]  ? _raw_spin_lock+0x2e/0x40
[   47.233125][    C1]  end_report+0x73/0x170
[   47.233546][    C1]  ? _raw_spin_lock+0x2e/0x40
[   47.234008][    C1]  kasan_report+0x128/0x150
[   47.234456][    C1]  ? _raw_spin_lock+0x2e/0x40
[   47.234923][    C1]  __kasan_check_byte+0x2a/0x40
[   47.235402][    C1]  lock_acquire+0x7d/0x350
[   47.235844][    C1]  ? lock_acquire+0x115/0x350
[   47.236309][    C1]  _raw_spin_lock+0x2e/0x40
[   47.236760][    C1]  ? ath9k_htc_tx_cleanup_timer+0x57/0x4d0
[   47.237328][    C1]  ath9k_htc_tx_cleanup_timer+0x57/0x4d0
[   47.237880][    C1]  call_timer_fn+0x18d/0x5f0
[   47.238337][    C1]  ? __pfx_ath9k_htc_tx_cleanup_timer+0x10/0x10
[   47.238948][    C1]  ? call_timer_fn+0xd5/0x5f0
[   47.239412][    C1]  ? __pfx_call_timer_fn+0x10/0x10
[   47.239912][    C1]  ? _raw_spin_unlock_irq+0x23/0x50
[   47.240423][    C1]  ? __pfx_ath9k_htc_tx_cleanup_timer+0x10/0x10
[   47.241053][    C1]  __run_timer_base+0x652/0x8b0
[   47.241534][    C1]  ? lock_acquire+0x115/0x350
[   47.242002][    C1]  ? __pfx___run_timer_base+0x10/0x10
[   47.242558][    C1]  run_timer_softirq+0xb7/0x170
[   47.243037][    C1]  handle_softirqs+0x26a/0x8d0
[   47.243516][    C1]  __irq_exit_rcu+0xc6/0x220
[   47.243973][    C1]  irq_exit_rcu+0x9/0x30
[   47.244373][    C1]  sysvec_apic_timer_interrupt+0xa6/0xc0
[   47.244897][    C1]  </IRQ>
[   47.245174][    C1]  <TASK>
[   47.245461][    C1]  asm_sysvec_apic_timer_interrupt+0x1a/0x20
[   47.246014][    C1] RIP: 0010:__nbcon_atomic_flush_pending_con+0x261/0x3=
70
[   47.246663][    C1] Code: 00 02 00 00 75 41 e8 1e 1f 21 00 4d 85 ed
4c 8d 7c 24 40 75 0c e8 0f 1f 21 00 45 84 e4 75 0d eb 3b e8 03 1f 21
00 fb 45 84 e4 <74> 30 f6 44 24 50 02 49 bc 00 00 00 00 00 fc ff df 74
34 e8 e7 1e
[   47.248412][    C1] RSP: 0000:ffffc900073d6a80 EFLAGS: 00000202
[   47.248973][    C1] RAX: ffffffff81a7a58d RBX: 0000000000000949
RCX: ffff8881072b2640
[   47.249702][    C1] RDX: 0000000000000000 RSI: 0000000000000000
RDI: 0000000000000000
[   47.250430][    C1] RBP: ffffc900073d6b70 R08: ffffffff9077587f
R09: 1ffffffff20eeb0f
[   47.251245][    C1] R10: dffffc0000000000 R11: fffffbfff20eeb10
R12: dffffc0000000001
[   47.252010][    C1] R13: 0000000000000200 R14: ffffffff8f66d568
R15: ffffc900073d6ac0
[   47.252767][    C1]  ? __nbcon_atomic_flush_pending_con+0x25d/0x370
[   47.253363][    C1]  ? __pfx___nbcon_atomic_flush_pending_con+0x10/0x10
[   47.253989][    C1]  __nbcon_atomic_flush_pending+0x248/0x450
[   47.254544][    C1]  ? __pfx___nbcon_atomic_flush_pending+0x10/0x10
[   47.255138][    C1]  ? panic_on_this_cpu+0x32/0x40
[   47.255604][    C1]  vprintk_emit+0x1a6/0x5f0
[   47.256028][    C1]  ? __pfx_vprintk_emit+0x10/0x10
[   47.256497][    C1]  ? unwind_next_frame+0xa6/0x2550
[   47.256975][    C1]  _printk+0xdd/0x130
[   47.257355][    C1]  ? __pfx_ath9k_htc_tx_cleanup_timer+0x10/0x10
[   47.257974][    C1]  ? __pfx__printk+0x10/0x10
[   47.258433][    C1]  ? unwind_next_frame+0xa6/0x2550
[   47.258939][    C1]  ? get_stack_info_noinstr+0x1b/0x130
[   47.259450][    C1]  ? wq_watchdog_touch+0x100/0x160
[   47.259926][    C1]  ? __pfx_ath9k_htc_tx_cleanup_timer+0x10/0x10
[   47.260505][    C1]  ? __pfx_ath9k_htc_tx_cleanup_timer+0x10/0x10
[   47.261167][    C1]  __show_trace_log_lvl+0x44d/0x550
[   47.261681][    C1]  ? debug_check_no_obj_freed+0x3a2/0x470
[   47.262235][    C1]  __warn+0x181/0x4c0
[   47.262628][    C1]  ? debug_print_object+0xec/0x230
[   47.263103][    C1]  ? debug_print_object+0xec/0x230
[   47.263581][    C1]  __report_bug+0x273/0x580
[   47.264006][    C1]  ? debug_print_object+0xec/0x230
[   47.264484][    C1]  ? __pfx___report_bug+0x10/0x10
[   47.264950][    C1]  ? ret_from_fork_asm+0x1a/0x30
[   47.265418][    C1]  report_bug_entry+0x19b/0x290
[   47.265873][    C1]  ? debug_print_object+0x18a/0x230
[   47.266354][    C1]  ? debug_print_object+0x18f/0x230
[   47.266839][    C1]  handle_bug+0xce/0x200
[   47.267238][    C1]  exc_invalid_op+0x1a/0x50
[   47.267669][    C1]  asm_exc_invalid_op+0x1a/0x20
[   47.268121][    C1] RIP: 0010:debug_print_object+0x18a/0x230
[   47.268663][    C1] Code: f8 48 c1 e8 03 80 3c 18 00 74 08 4c 89 ff
e8 dd 00 5d fd 4d 8b 0f 4c 89 ef 48 8b 74 24 08 48 89 ea 44 89 e1 4d
89 f0 ff 34 24 <67> 48 0f b9 3a 48 83 c4 08 ff 05 b3 e5 94 0b 48 83 c4
10 5b 41 5c
[   47.270409][    C1] RSP: 0000:ffffc900073d71b0 EFLAGS: 00010246
[   47.270969][    C1] RAX: 1ffffffff181f204 RBX: dffffc0000000000
RCX: 0000000000000000
[   47.271807][    C1] RDX: ffffffff8c6d6240 RSI: ffffffff8c6d5cc0
RDI: ffffffff908259e0
[   47.272569][    C1] RBP: ffffffff8c6d6240 R08: ffff8880232eb9d8
R09: ffffffff8c0fa380
[   47.273292][    C1] R10: dffffc0000000000 R11: ffffffff81b485d0
R12: 0000000000000000
[   47.274018][    C1] R13: ffffffff908259e0 R14: ffff8880232eb9d8
R15: ffffffff8c0f9020
[   47.274744][    C1]  ? __pfx_timer_debug_hint+0x10/0x10
[   47.275242][    C1]  ? __pfx_ath9k_htc_tx_cleanup_timer+0x10/0x10
[   47.275821][    C1]  ? __pfx_ath9k_htc_tx_cleanup_timer+0x10/0x10
[   47.276400][    C1]  debug_check_no_obj_freed+0x3a2/0x470
[   47.276913][    C1]  __free_frozen_pages+0x5ae/0xe20
[   47.277394][    C1]  ? __pfx_wiphy_dev_release+0x10/0x10
[   47.277901][    C1]  device_release+0xc4/0x1f0
[   47.278334][    C1]  kobject_put+0x228/0x560
[   47.278757][    C1]  ath9k_hif_usb_disconnect+0x135/0x240
[   47.279268][    C1]  usb_unbind_interface+0x26e/0x8f0
[   47.279760][    C1]  ? kernfs_remove_by_name_ns+0x101/0x140
[   47.280289][    C1]  ? __pfx_usb_unbind_interface+0x10/0x10
[   47.280822][    C1]  device_release_driver_internal+0x4d9/0x870
[   47.281495][    C1]  bus_remove_device+0x455/0x570
[   47.281980][    C1]  ? __pfx_bus_remove_device+0x10/0x10
[   47.282519][    C1]  ? kernfs_remove_by_name_ns+0x101/0x140
[   47.283046][    C1]  device_del+0x527/0x8f0
[   47.283458][    C1]  ? __pfx_device_del+0x10/0x10
[   47.283912][    C1]  ? kobject_put+0x51d/0x560
[   47.284345][    C1]  usb_disable_device+0x3d4/0x8d0
[   47.284819][    C1]  usb_disconnect+0x32f/0x990
[   47.285258][    C1]  hub_event+0x1cc9/0x4f30
[   47.285686][    C1]  ? __pfx_hub_event+0x10/0x10
[   47.286133][    C1]  ? process_scheduled_works+0x94e/0x1900
[   47.286662][    C1]  ? process_scheduled_works+0x94e/0x1900
[   47.287187][    C1]  ? process_scheduled_works+0x94e/0x1900
[   47.287715][    C1]  process_scheduled_works+0xc99/0x1900
[   47.288228][    C1]  ? __pfx_process_scheduled_works+0x10/0x10
[   47.288783][    C1]  ? assign_work+0x3d5/0x5e0
[   47.289215][    C1]  worker_thread+0xa53/0xfc0
[   47.289654][    C1]  kthread+0x38b/0x480
[   47.290037][    C1]  ? __pfx_worker_thread+0x10/0x10
[   47.290518][    C1]  ? __pfx_kthread+0x10/0x10
[   47.290950][    C1]  ret_from_fork+0x514/0xb70
[   47.291485][    C1]  ? __pfx_ret_from_fork+0x10/0x10
[   47.291985][    C1]  ? __switch_to+0xc68/0x1400
[   47.292454][    C1]  ? __pfx_kthread+0x10/0x10
[   47.292888][    C1]  ret_from_fork_asm+0x1a/0x30
[   47.293338][    C1]  </TASK>
[   47.293884][    C1] Kernel Offset: disabled
[   47.294448][    C1] Rebooting in 86400 seconds..

Thanks!

On Mon, Nov 9, 2026 at 3:35=E2=80=AFAM Chad Aldreda <ca@modelmiser.com> wro=
te:
>
> Hi Farhad,
>
> Could you share the reproducer for this one?
>
> Two paths in the code would fit the report. Both end the same way:
> the timer re-arms itself (ath9k_htc_tx_cleanup_timer()), and nothing
> deletes it before ath9k_htc_disconnect_device() frees the hw.
>
> 1. ath9k_fatal_work() calls ath9k_htc_reset(), which re-arms
>    tx.cleanup_timer without checking ATH_OP_INVALID. A WMI_FATAL_EVENTID
>    (or beacon-stuck SWBA) that arrives after ath9k_htc_stop() has
>    finished still queues fatal_work, since WMI events are processed
>    until ath9k_stop_wmi(). The timer is then armed on a stopped device,
>    and ieee80211_unregister_hw() does not call stop again.
>
> 2. Inside ath9k_htc_stop(), the timer is deleted and priv->mutex is
>    dropped before cancel_work_sync(&priv->fatal_work). A fatal_work
>    already waiting on the mutex runs the reset in that gap and re-arms
>    the timer.
>
> I'd like to know which one your reproducer hits before proposing a
> fix. Does it send WMI_FATAL_EVENTID (or let beacons go stuck in
> AP/IBSS/mesh mode), and is the interface up or down when it does?
>
> The code reading above was done with an AI assistant (Claude). Nothing
> has been tested yet.
>
> Thanks,
> Chad
>

--000000000000f346b80660b87a58
Content-Type: application/octet-stream; name="reproducer.c"
Content-Disposition: attachment; filename="reproducer.c"
Content-Transfer-Encoding: base64
Content-ID: <f_mwp8xgjn0>
X-Attachment-Id: f_mwp8xgjn0

I2luY2x1ZGUgPGRpcmVudC5oPgojaW5jbHVkZSA8ZXJybm8uaD4KI2luY2x1ZGUgPGZjbnRsLmg+
CiNpbmNsdWRlIDxsaW51eC91c2IvY2g5Lmg+CiNpbmNsdWRlIDxsaW51eC91c2IvcmF3X2dhZGdl
dC5oPgojaW5jbHVkZSA8cHRocmVhZC5oPgojaW5jbHVkZSA8c3RkaW8uaD4KI2luY2x1ZGUgPHN0
cmluZy5oPgojaW5jbHVkZSA8c3lzL2lvY3RsLmg+CiNpbmNsdWRlIDxzeXMvd2FpdC5oPgojaW5j
bHVkZSA8dW5pc3RkLmg+CgojZGVmaW5lIFdNSV9UQVJHRVRfSUNfVVBEQVRFX0NNRElEIDB4MDAx
OAojZGVmaW5lIEFUSDlLX0ZJUk1XQVJFX0RPV05MT0FEX0NPTVAgMHgzMQoKc3RhdGljIGNvbnN0
IHVuc2lnbmVkIGNoYXIgZGV2aWNlX2Rlc2NyaXB0b3JbXSA9IHsKICAgIDB4MTIsIDB4MDEsIDB4
MDAsIDB4MDIsIDB4ZmYsIDB4ZmYsIDB4ZmYsIDB4NDAsIDB4ZjMsIDB4MGMsIDB4NzEsIDB4OTIs
CiAgICAweDA4LCAweDAxLCAweDAxLCAweDAyLCAweDAzLCAweDAxfTsKc3RhdGljIGNvbnN0IHVu
c2lnbmVkIGNoYXIgY29uZmlnX2Rlc2NyaXB0b3JbXSA9IHsKICAgIDB4MDksIDB4MDIsIDB4NDgs
IDB4MDAsIDB4MDEsIDB4MDEsIDB4MDAsIDB4ODAsIDB4ZmEsCiAgICAweDA5LCAweDA0LCAweDAw
LCAweDAwLCAweDA2LCAweGZmLCAweDAwLCAweDAwLCAweDAwLAogICAgMHgwOSwgMHgwNSwgMHgw
MSwgMHgwMiwgMHgwMCwgMHgwMiwgMHgwMCwgMHgwMCwgMHgwMCwKICAgIDB4MDksIDB4MDUsIDB4
ODIsIDB4MDIsIDB4MDAsIDB4MDIsIDB4MDAsIDB4MDAsIDB4MDAsCiAgICAweDA5LCAweDA1LCAw
eDgzLCAweDAzLCAweDQwLCAweDAwLCAweDAxLCAweDAwLCAweDAwLAogICAgMHgwOSwgMHgwNSwg
MHgwNCwgMHgwMywgMHg0MCwgMHgwMCwgMHgwMSwgMHgwMCwgMHgwMCwKICAgIDB4MDksIDB4MDUs
IDB4MDUsIDB4MDIsIDB4MDAsIDB4MDIsIDB4MDAsIDB4MDAsIDB4MDAsCiAgICAweDA5LCAweDA1
LCAweDA2LCAweDAyLCAweDAwLCAweDAyLCAweDAwLCAweDAwLCAweDAwfTsKc3RhdGljIGNvbnN0
IHVuc2lnbmVkIGNoYXIgbGFuZ3VhZ2VfaWRfc3RyaW5nW10gPSB7NCwgVVNCX0RUX1NUUklORywg
MHgwOSwgMHgwNH07CnN0YXRpYyBjb25zdCB1bnNpZ25lZCBjaGFyIHN5el9zdHJpbmdbXSA9IHs4
LCBVU0JfRFRfU1RSSU5HLCAncycsIDAsICd5JywgMCwgJ3onLCAwfTsKCnN0cnVjdCBlbmRwb2lu
dF9pbyB7CiAgc3RydWN0IHVzYl9yYXdfZXBfaW8gaGVhZGVyOwogIHVuc2lnbmVkIGNoYXIgZGF0
YVs0MDk2XTsKfTsKCnN0YXRpYyBpbnQgcmF3X2dhZGdldF9mZDsKc3RhdGljIGludCByZWdpc3Rl
cl9vdXRfaGFuZGxlLCByZWdpc3Rlcl9pbl9oYW5kbGU7CgpzdGF0aWMgdm9pZCBwdXRfYmUzMih1
bnNpZ25lZCBjaGFyKiBkZXN0aW5hdGlvbiwgdW5zaWduZWQgaW50IHZhbHVlKQp7CiAgZGVzdGlu
YXRpb25bMF0gPSB2YWx1ZSA+PiAyNDsKICBkZXN0aW5hdGlvblsxXSA9IHZhbHVlID4+IDE2Owog
IGRlc3RpbmF0aW9uWzJdID0gdmFsdWUgPj4gODsKICBkZXN0aW5hdGlvblszXSA9IHZhbHVlOwp9
CgpzdGF0aWMgdm9pZCBzZW5kX29uX3JlZ2lzdGVyX2luKGNvbnN0IHZvaWQqIGZyYW1lLCB1bnNp
Z25lZCBpbnQgbGVuZ3RoKQp7CiAgc3RydWN0IGVuZHBvaW50X2lvIHJlcGx5ID0gey5oZWFkZXIg
PSB7LmVwID0gcmVnaXN0ZXJfaW5faGFuZGxlLCAubGVuZ3RoID0gbGVuZ3RofX07CiAgbWVtY3B5
KHJlcGx5LmRhdGEsIGZyYW1lLCBsZW5ndGgpOwogIGlvY3RsKHJhd19nYWRnZXRfZmQsIFVTQl9S
QVdfSU9DVExfRVBfV1JJVEUsICZyZXBseSk7Cn0KCnN0YXRpYyB2b2lkIGVudW1lcmF0ZV9hbmRf
bG9hZF9maXJtd2FyZSh2b2lkKQp7CiAgc3RydWN0IHVzYl9yYXdfaW5pdCBpbml0ID0gey5kcml2
ZXJfbmFtZSA9ICJkdW1teV91ZGMiLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAuZGV2
aWNlX25hbWUgPSAiZHVtbXlfdWRjLjAiLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAu
c3BlZWQgPSBVU0JfU1BFRURfSElHSH07CiAgaW50IGZpcm13YXJlX2Rvd25sb2FkX2RvbmUgPSAw
OwogIHJhd19nYWRnZXRfZmQgPSBvcGVuKCIvZGV2L3Jhdy1nYWRnZXQiLCBPX1JEV1IpOwogIGlv
Y3RsKHJhd19nYWRnZXRfZmQsIFVTQl9SQVdfSU9DVExfSU5JVCwgJmluaXQpOwogIGlvY3RsKHJh
d19nYWRnZXRfZmQsIFVTQl9SQVdfSU9DVExfUlVOLCAwKTsKICB3aGlsZSAoIWZpcm13YXJlX2Rv
d25sb2FkX2RvbmUpIHsKICAgIHN0cnVjdCB7CiAgICAgIHN0cnVjdCB1c2JfcmF3X2V2ZW50IGhl
YWRlcjsKICAgICAgc3RydWN0IHVzYl9jdHJscmVxdWVzdCByZXF1ZXN0OwogICAgfSBldmVudCA9
IHsuaGVhZGVyID0gey5sZW5ndGggPSBzaXplb2Yoc3RydWN0IHVzYl9jdHJscmVxdWVzdCl9fTsK
ICAgIHN0cnVjdCBlbmRwb2ludF9pbyByZXNwb25zZSA9IHswfTsKICAgIGNvbnN0IHZvaWQqIGlu
X2RhdGEgPSBOVUxMOwogICAgdW5zaWduZWQgaW50IGluX2xlbmd0aCA9IDA7CiAgICBpb2N0bChy
YXdfZ2FkZ2V0X2ZkLCBVU0JfUkFXX0lPQ1RMX0VWRU5UX0ZFVENILCAmZXZlbnQpOwogICAgaWYg
KGV2ZW50LmhlYWRlci50eXBlICE9IFVTQl9SQVdfRVZFTlRfQ09OVFJPTCkKICAgICAgY29udGlu
dWU7CiAgICBpZiAoZXZlbnQucmVxdWVzdC5iUmVxdWVzdFR5cGUgJiBVU0JfRElSX0lOKSB7CiAg
ICAgIHVuc2lnbmVkIGludCBkZXNjcmlwdG9yX3R5cGUgPSBldmVudC5yZXF1ZXN0LndWYWx1ZSA+
PiA4OwogICAgICB1bnNpZ25lZCBpbnQgc3RyaW5nX2luZGV4ID0gZXZlbnQucmVxdWVzdC53VmFs
dWUgJiAweGZmOwogICAgICBpZiAoZGVzY3JpcHRvcl90eXBlID09IFVTQl9EVF9ERVZJQ0UpCiAg
ICAgICAgaW5fZGF0YSA9IGRldmljZV9kZXNjcmlwdG9yLCBpbl9sZW5ndGggPSBzaXplb2YoZGV2
aWNlX2Rlc2NyaXB0b3IpOwogICAgICBlbHNlIGlmIChkZXNjcmlwdG9yX3R5cGUgPT0gVVNCX0RU
X0NPTkZJRykKICAgICAgICBpbl9kYXRhID0gY29uZmlnX2Rlc2NyaXB0b3IsIGluX2xlbmd0aCA9
IHNpemVvZihjb25maWdfZGVzY3JpcHRvcik7CiAgICAgIGVsc2UgaWYgKGRlc2NyaXB0b3JfdHlw
ZSA9PSBVU0JfRFRfU1RSSU5HICYmIHN0cmluZ19pbmRleCA9PSAwKQogICAgICAgIGluX2RhdGEg
PSBsYW5ndWFnZV9pZF9zdHJpbmcsIGluX2xlbmd0aCA9IHNpemVvZihsYW5ndWFnZV9pZF9zdHJp
bmcpOwogICAgICBlbHNlIGlmIChkZXNjcmlwdG9yX3R5cGUgPT0gVVNCX0RUX1NUUklORykKICAg
ICAgICBpbl9kYXRhID0gc3l6X3N0cmluZywgaW5fbGVuZ3RoID0gc2l6ZW9mKHN5el9zdHJpbmcp
OwogICAgICBlbHNlIHsKICAgICAgICBpb2N0bChyYXdfZ2FkZ2V0X2ZkLCBVU0JfUkFXX0lPQ1RM
X0VQMF9TVEFMTCwgMCk7CiAgICAgICAgY29udGludWU7CiAgICAgIH0KICAgICAgaWYgKGluX2xl
bmd0aCA+IGV2ZW50LnJlcXVlc3Qud0xlbmd0aCkKICAgICAgICBpbl9sZW5ndGggPSBldmVudC5y
ZXF1ZXN0LndMZW5ndGg7CiAgICAgIHJlc3BvbnNlLmhlYWRlci5sZW5ndGggPSBpbl9sZW5ndGg7
CiAgICAgIG1lbWNweShyZXNwb25zZS5kYXRhLCBpbl9kYXRhLCBpbl9sZW5ndGgpOwogICAgICBp
b2N0bChyYXdfZ2FkZ2V0X2ZkLCBVU0JfUkFXX0lPQ1RMX0VQMF9XUklURSwgJnJlc3BvbnNlKTsK
ICAgICAgY29udGludWU7CiAgICB9CiAgICBpZiAoZXZlbnQucmVxdWVzdC5iUmVxdWVzdCA9PSBV
U0JfUkVRX1NFVF9DT05GSUdVUkFUSU9OICYmCiAgICAgICAgKGV2ZW50LnJlcXVlc3QuYlJlcXVl
c3RUeXBlICYgVVNCX1RZUEVfTUFTSykgPT0gVVNCX1RZUEVfU1RBTkRBUkQpIHsKICAgICAgaW9j
dGwocmF3X2dhZGdldF9mZCwgVVNCX1JBV19JT0NUTF9WQlVTX0RSQVcsIGNvbmZpZ19kZXNjcmlw
dG9yWzhdKTsKICAgICAgaW9jdGwocmF3X2dhZGdldF9mZCwgVVNCX1JBV19JT0NUTF9DT05GSUdV
UkUsIDApOwogICAgICBmb3IgKGludCBvZmZzZXQgPSAxODsgb2Zmc2V0IDwgc2l6ZW9mKGNvbmZp
Z19kZXNjcmlwdG9yKTsgb2Zmc2V0ICs9IDkpIHsKICAgICAgICBpbnQgaGFuZGxlID0gaW9jdGwo
cmF3X2dhZGdldF9mZCwgVVNCX1JBV19JT0NUTF9FUF9FTkFCTEUsCiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICZjb25maWdfZGVzY3JpcHRvcltvZmZzZXRdKTsKICAgICAgICBpZiAoY29uZmln
X2Rlc2NyaXB0b3Jbb2Zmc2V0ICsgMl0gPT0gMHgwNCkKICAgICAgICAgIHJlZ2lzdGVyX291dF9o
YW5kbGUgPSBoYW5kbGU7CiAgICAgICAgaWYgKGNvbmZpZ19kZXNjcmlwdG9yW29mZnNldCArIDJd
ID09IDB4ODMpCiAgICAgICAgICByZWdpc3Rlcl9pbl9oYW5kbGUgPSBoYW5kbGU7CiAgICAgIH0K
ICAgIH0KICAgIGlmIChldmVudC5yZXF1ZXN0LmJSZXF1ZXN0ID09IEFUSDlLX0ZJUk1XQVJFX0RP
V05MT0FEX0NPTVApCiAgICAgIGZpcm13YXJlX2Rvd25sb2FkX2RvbmUgPSAxOwogICAgcmVzcG9u
c2UuaGVhZGVyLmxlbmd0aCA9IGV2ZW50LnJlcXVlc3Qud0xlbmd0aDsKICAgIGlvY3RsKHJhd19n
YWRnZXRfZmQsIFVTQl9SQVdfSU9DVExfRVAwX1JFQUQsICZyZXNwb25zZSk7CiAgfQogIHVzbGVl
cCgyMDAgKiAxMDAwKTsKfQoKc3RhdGljIHZvaWQqIGFuc3dlcl93bWlfY29tbWFuZHModm9pZCog
dW51c2VkKQp7CiAgc3RhdGljIGNvbnN0IHVuc2lnbmVkIGNoYXIgaHRjX2Nvbm5lY3Rfc2Vydmlj
ZV9yZXNwb25zZVtdID0gewogICAgICAweDAwLCAweDAwLCAweDAwLCAweDBhLCAweDAwLCAweDAw
LCAweDAwLCAweDAwLCAweDAwLAogICAgICAweDAzLCAweDAxLCAweDAwLCAweDAwLCAweDAxLCAw
eDAyLCAweDAwLCAweDAwLCAweDAwfTsKICBmb3IgKDs7KSB7CiAgICBzdHJ1Y3QgZW5kcG9pbnRf
aW8gY29tbWFuZCA9IHsuaGVhZGVyID0gey5lcCA9IHJlZ2lzdGVyX291dF9oYW5kbGUsIC5sZW5n
dGggPSAxMDI0fX07CiAgICB1bnNpZ25lZCBjaGFyIHJlcGx5WzQ0XSA9IHswfTsKICAgIHVuc2ln
bmVkIGludCB3bWlfY29tbWFuZF9pZCwgZmlyc3RfcmVnaXN0ZXI7CiAgICBpZiAoaW9jdGwocmF3
X2dhZGdldF9mZCwgVVNCX1JBV19JT0NUTF9FUF9SRUFELCAmY29tbWFuZCkgPCAxMikKICAgICAg
Y29udGludWU7CiAgICBpZiAoY29tbWFuZC5kYXRhWzBdID09IDApIHsKICAgICAgc2VuZF9vbl9y
ZWdpc3Rlcl9pbihodGNfY29ubmVjdF9zZXJ2aWNlX3Jlc3BvbnNlLAogICAgICAgICAgICAgICAg
ICAgICAgICAgICBzaXplb2YoaHRjX2Nvbm5lY3Rfc2VydmljZV9yZXNwb25zZSkpOwogICAgICBj
b250aW51ZTsKICAgIH0KICAgIHdtaV9jb21tYW5kX2lkID0gY29tbWFuZC5kYXRhWzhdIDw8IDgg
fCBjb21tYW5kLmRhdGFbOV07CiAgICBpZiAod21pX2NvbW1hbmRfaWQgPT0gV01JX1RBUkdFVF9J
Q19VUERBVEVfQ01ESUQpCiAgICAgIGNvbnRpbnVlOwogICAgcmVwbHlbMF0gPSBjb21tYW5kLmRh
dGFbMF07CiAgICByZXBseVszXSA9IHNpemVvZihyZXBseSkgLSA4OwogICAgbWVtY3B5KHJlcGx5
ICsgOCwgY29tbWFuZC5kYXRhICsgOCwgNCk7CiAgICBmaXJzdF9yZWdpc3RlciA9IGNvbW1hbmQu
ZGF0YVsxMl0gPDwgMjQgfCBjb21tYW5kLmRhdGFbMTNdIDw8IDE2IHwKICAgICAgICAgICAgICAg
ICAgICAgY29tbWFuZC5kYXRhWzE0XSA8PCA4IHwgY29tbWFuZC5kYXRhWzE1XTsKICAgIGlmICh3
bWlfY29tbWFuZF9pZCA9PSAweDAwMDMpIHsKICAgICAgcHV0X2JlMzIocmVwbHkgKyAxMiwgMHgw
MDAxMDAwNCk7CiAgICB9IGVsc2UgaWYgKGZpcnN0X3JlZ2lzdGVyID09IDB4MjQwMCkgewogICAg
ICBwdXRfYmUzMihyZXBseSArIDEyLCAweDAwMDAwMDEyKTsKICAgICAgcHV0X2JlMzIocmVwbHkg
KyAxNiwgMHgwMDAwNjg4YSk7CiAgICAgIHB1dF9iZTMyKHJlcGx5ICsgMjAsIDB4MDAwMGUwMDEp
OwogICAgICBwdXRfYmUzMihyZXBseSArIDI0LCAweDAwMDAwMDAyKTsKICAgICAgcHV0X2JlMzIo
cmVwbHkgKyAzNiwgMHgwMDAwMTEwMik7CiAgICAgIHB1dF9iZTMyKHJlcGx5ICsgNDAsIDB4MDAw
MDMzMjIpOwogICAgfSBlbHNlIGlmIChmaXJzdF9yZWdpc3RlciA9PSAweDI0MjApIHsKICAgICAg
cHV0X2JlMzIocmVwbHkgKyAxMiwgMHgwMDAwNTU0NCk7CiAgICAgIHB1dF9iZTMyKHJlcGx5ICsg
MTYsIDB4MDAwMDAwMDEpOwogICAgfSBlbHNlIHsKICAgICAgdW5zaWduZWQgaW50IHJlZ2lzdGVy
X3ZhbHVlID0gMHhjMDsKICAgICAgaWYgKGZpcnN0X3JlZ2lzdGVyID09IDB4NDA3YykKICAgICAg
ICByZWdpc3Rlcl92YWx1ZSA9IDB4YTU1YTsKICAgICAgZWxzZSBpZiAoZmlyc3RfcmVnaXN0ZXIg
PT0gMHg3MDQ0KQogICAgICAgIHJlZ2lzdGVyX3ZhbHVlID0gMjsKICAgICAgZWxzZSBpZiAoKGZp
cnN0X3JlZ2lzdGVyICYgMHhmZmZmZjAwMCkgPT0gMHgyMDAwKQogICAgICAgIHJlZ2lzdGVyX3Zh
bHVlID0gMDsKICAgICAgZm9yIChpbnQgd29yZCA9IDA7IHdvcmQgPCA4OyB3b3JkKyspCiAgICAg
ICAgcHV0X2JlMzIocmVwbHkgKyAxMiArIDQgKiB3b3JkLCByZWdpc3Rlcl92YWx1ZSk7CiAgICB9
CiAgICBzZW5kX29uX3JlZ2lzdGVyX2luKHJlcGx5LCBzaXplb2YocmVwbHkpKTsKICB9CiAgcmV0
dXJuIHVudXNlZDsKfQoKc3RhdGljIHZvaWQgYnJpbmdfdXBfYXRoOWtfbmV0ZGV2KHZvaWQpCnsK
ICBmb3IgKGludCBhdHRlbXB0ID0gMDsgYXR0ZW1wdCA8IDYwMDsgYXR0ZW1wdCsrLCB1c2xlZXAo
MjUgKiAxMDAwKSkgewogICAgRElSKiBuZXRfY2xhc3MgPSBvcGVuZGlyKCIvc3lzL2NsYXNzL25l
dCIpOwogICAgc3RydWN0IGRpcmVudCogbmV0ZGV2OwogICAgd2hpbGUgKChuZXRkZXYgPSByZWFk
ZGlyKG5ldF9jbGFzcykpKSB7CiAgICAgIGNoYXIgcGF0aFs1MTJdLCBkcml2ZXJfbGlua1syNTZd
ID0gezB9OwogICAgICBzbnByaW50ZihwYXRoLCBzaXplb2YocGF0aCksICIvc3lzL2NsYXNzL25l
dC8lcy9kZXZpY2UvZHJpdmVyIiwgbmV0ZGV2LT5kX25hbWUpOwogICAgICBpZiAocmVhZGxpbmso
cGF0aCwgZHJpdmVyX2xpbmssIHNpemVvZihkcml2ZXJfbGluaykgLSAxKSA+IDAgJiYKICAgICAg
ICAgIHN0cnN0cihkcml2ZXJfbGluaywgIi9hdGg5a19odGMiKSkKICAgICAgICBicmVhazsKICAg
IH0KICAgIGlmICghbmV0ZGV2KSB7CiAgICAgIGNsb3NlZGlyKG5ldF9jbGFzcyk7CiAgICAgIGNv
bnRpbnVlOwogICAgfQogICAgY2hhciBmbGFnc19wYXRoWzUxMl07CiAgICBzbnByaW50ZihmbGFn
c19wYXRoLCBzaXplb2YoZmxhZ3NfcGF0aCksICIvc3lzL2NsYXNzL25ldC8lcy9mbGFncyIsIG5l
dGRldi0+ZF9uYW1lKTsKICAgIGNsb3NlZGlyKG5ldF9jbGFzcyk7CiAgICBpbnQgZmxhZ3NfZmQg
PSBvcGVuKGZsYWdzX3BhdGgsIE9fV1JPTkxZKTsKICAgIGludCB3cml0ZV9yZXN1bHQgPSB3cml0
ZShmbGFnc19mZCwgIjB4MTAwMyIsIDYpOwogICAgY2xvc2UoZmxhZ3NfZmQpOwogICAgaWYgKHdy
aXRlX3Jlc3VsdCA8IDAgJiYgZXJybm8gPT0gRVRJTUVET1VUKQogICAgICByZXR1cm47CiAgfQp9
CgpzdGF0aWMgdm9pZCBwbHVnX2JyaW5nX3VwX2FuZF91bnBsdWcodm9pZCkKewogIHN0YXRpYyBj
b25zdCB1bnNpZ25lZCBjaGFyIGh0Y19yZWFkeV9mcmFtZVtdID0gewogICAgICAweDAwLCAweDAw
LCAweDAwLCAweDA4LCAweDAwLCAweDQwLCAweDAwLCAweDAwLAogICAgICAweDAwLCAweDAxLCAw
eDAwLCAweDIxLCAweDAwLCAweDQwLCAweDA4LCAweDAwfTsKICBwdGhyZWFkX3Qgd21pX3Jlc3Bv
bmRlcjsKICBlbnVtZXJhdGVfYW5kX2xvYWRfZmlybXdhcmUoKTsKICBwdGhyZWFkX2NyZWF0ZSgm
d21pX3Jlc3BvbmRlciwgTlVMTCwgYW5zd2VyX3dtaV9jb21tYW5kcywgTlVMTCk7CiAgc2VuZF9v
bl9yZWdpc3Rlcl9pbihodGNfcmVhZHlfZnJhbWUsIHNpemVvZihodGNfcmVhZHlfZnJhbWUpKTsK
ICBicmluZ191cF9hdGg5a19uZXRkZXYoKTsKfQoKaW50IG1haW4odm9pZCkKewogIGlmIChmb3Jr
KCkgPT0gMCkgewogICAgcGx1Z19icmluZ191cF9hbmRfdW5wbHVnKCk7CiAgICBfZXhpdCgwKTsK
ICB9CiAgd2FpdChOVUxMKTsKICBzbGVlcCg1KTsKICByZXR1cm4gMDsKfQo=
--000000000000f346b80660b87a58--
