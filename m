Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794408280;
	b=C6LkR1NiEHPUEwX4j+WhDs0d5Imm183I/J+glE3OhvnzhI2+fJghXRehB9Wlhfs2MeJ1
	 EZ/21x0TbwIWnc0VAIBxz6sDqshTvtM0zeHLIZG13a2LH/QEeO5aQDIX9FLdxpJ3MtNYh
	 VGyDXA2vRj5pGEAqsDmbDW8Yu/88gv41Sa0rUH8690Uedbu6LPF2B04u+sWpRaBcFTNYz
	 NHCNmfaWK9zUfbBGsMNn8JVzbr1+jDEhEcfkuycB9/lTZJeRa9ggHrFlMhYWRjJa16CXD
	 uAftUhiPUeTAe9plCQYjTTpHt2wltqC/c5eFL+isESjuLCc9AHcIEeNbAD8se0L5ehg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794408280;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1RU0Zv7xZ1eKDPvSIZ7kINuDvaMO3evWPcMZzj06nYs=;
	b=EC6BZlG+My0aP0wONcxxT6iqqh2HsrNAZTHbXEW3ye8wTki0ggSxakfQjfDPYzRMPVqx
	 lXGGPk5SwaJN2v4xSN17owjwYSdSVZt0zMD9GwE5dD7X4iuYkGkM8F7IvOJ24D+2GNwJf
	 FRthjeN106Zd5ZW0mNSaczKxwJX8EXfjMy7hyJC90FvGZRw5ov/1eWLPOrHbzoy63mxJf
	 dCGOpVdSVjUqK+Xxn71wMxx7ffn6q+9lXXVWRplEEZ3qAOK8x5jNSQhkpnifkNaqoE9sS
	 TYEBL6BLBoN8A+ZPMkrVIWA9AP0PgXKjdN8GmVcu4hh4OzORSnLuS/iiRDX96b0tJ9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tv4XS0at;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D5960A262A
	for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 14:44:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38D5960A262A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tv4XS0at
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4919a880834so1968917f8f.0
        for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 06:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794408278; x=1795013078; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1RU0Zv7xZ1eKDPvSIZ7kINuDvaMO3evWPcMZzj06nYs=;
        b=Tv4XS0atL2sErZzJ3D+XCHF3t9L8QZC6nkoyRW3MjlQOkW/sDiruQvqc5H3OfXZ7xL
         wCouxXoHfRD+m/alkNRBPHbsuUsKQ2ItrpKyDskmBbL6hab2z7Py4iTG5ojqAT+T9jPE
         2HoaqDrprZrXliOy5t/AGj4NJRYKOtyYEZiBQR1Gg3GN0hZIMajKliMVPWvFZXjBxoj2
         64zJe260N4iZRhLJVjvkzejYZPAG01uE8EdK74wdHOYR2+9XzT3OdX2fqPLvWkdIZXCk
         egmAhs4vScv6BZ3iyJZwl7xvC9x4lvWkbgFp19/e+QA9O0WIGrlsAbU1ZgwzT39zOZWN
         EyXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794408278; x=1795013078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1RU0Zv7xZ1eKDPvSIZ7kINuDvaMO3evWPcMZzj06nYs=;
        b=nE0JwnKugMNGK1xo4U7yKOBnLJWOrDXqyHRFo7nEH/V7h/743+oMyNK9x1M6z2PCcd
         MdToI6bWqkzTb7zB7l7viab6M1PPaq0XY95c1Z2/Ly/5H95QxgO+9ahA/MXobrjnQ4xD
         y0vMkCqJJfDB9Xk1ea4T0Ep/GEpigE/BFGHnSH4FTq4rsUgotCeKArS0yvvydkLWqVjZ
         HWZ4LWJAQc6Q+A+lZMEl7Y+5X60845UVQYD7ACR09dzdJQHYDgV/bimgdvJ8dkXp7rMH
         hzMfD5l0pGe1D8aV8cKp993UAkkTtQ3rGr0lFrQj6+6S7wy8DYNp7qEqu+dwKvH1Zvgf
         UH4A==
X-Forwarded-Encrypted: i=1; AL+hErHZwj7fHYEY9jLkF/nqTJ0F7GLpORDzS4bXcR0UTY9KtqesiRPYJJsrE3SVezA3U0qzwOLhvvYoE6HML7ZqBA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+ypy0bGPdyDAovbeV1gG8PDXxdM/QcSLVA+N78XRoqTL6iaSso
	S5Wmbk1vWyyYX6rrRDV64Z2pgGOqZEiGfs2rR9BzRzjOS5QoSRgJ3QI3
X-Gm-Gg: AYBFou2+5h7mI/s8RBZayutgzQY8FCitIwWelS4wZWk5XWdjt33Y73ym6nOiJ/020k4
	msZDmK0ZwEsrwWwg2f/7m9fjoJC06jZ8/M7dUat5uZ3AKjwyZatQ8aEr1GWpxCHdrP7bVj8QCPK
	6sadwIbHOG6mt/nDIwYYJ5vGJYGaIN4GA8PEu12k5uh+syH348qrKSZbvro5LR1OPo2r783DI1F
	ATWLqw+WXbXA/oYgL38EPN+JERQxdc0BJIbUkojFPHAEFKrmYV2K6q5Qouy9hRbmBoN4EeiPwD6
	Aupj18SkiYMcCzieAy3kHZg9oTyO+Nf7jENs4yXvyp+CYnFE8pUmw7jzf/Y7AqxpSYkZC9pSTP5
	924THPsDix89HLZ8bI17Uuvl08nsc/auizvI071K8zQmyTqt/RGXeWM4L3BXRxILsT2WTNpXzdO
	NvBxkxvaJHIxiVgKJ4XBoiEE0PUI7MRkOSpD3E2SCtkYvgawTNSij8aniI/oY3erTM5ZF+7bDUf
	ZhXumLpXgCZYVdGS5NmE9iJ60Ijk6+n6inIByHM09J7zU2GTGX/zp4ILMvSPGw0poARy0VbmUuH
	/SMZaklwvvVhzK7xLVzy1nx8sDAnO4OlM04=
X-Received: by 2002:a05:600c:6214:b0:49c:fa20:cbfd with SMTP id 5b1f17b1804b1-4ba09375bb4mr45272705e9.20.1794408278331;
        Wed, 11 Nov 2026 06:44:38 -0800 (PST)
Received: from dev.Default ([86.127.229.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08de826asm46656495e9.0.2026.11.11.06.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:44:37 -0800 (PST)
From: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
To: Navid Ghahremani <ghahramani.navid@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Junyang Han <han.junyang@zte.com.cn>,
	=?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>,
	Felix Fietkau <nbd@nbd.name>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH net-next 4/5] net: ethernet: zte: zx279128s: offload flows to and from WLAN ports
Date: Wed, 11 Nov 2026 15:44:25 +0100
Message-Id: <20261111144426.1321237-5-isasmendi.agus@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20261111144426.1321237-1-isasmendi.agus@gmail.com>
References: <20261111144426.1321237-1-isasmendi.agus@gmail.com>
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

Accept flows whose egress or ingress is a mac80211 AP interface, bound
to a WLAN logical port on first use:

- egress: the flowtable hands over the AP interface, or the bridge in
  front of it (mac80211 fills no forwarding path, so the route stops at
  the bridge); one step of the bridge's forwarding path for the next
  hop MAC gives the interface.  The classifier entry's egress field
  takes the WLAN port instead of a bridge port; the fabric then writes
  the rewritten frame to the WLAN RX ring, and the ring delivers it to
  the interface.
- ingress: the flowtable reports the AP interface, or its bridge; the
  flow's pre-NAT source address leads through the bridge's neighbour
  entry and forwarding database to the interface.  The entry is
  installed like a switch port's, and its key is listed for the
  interface's ingress hook, which injects the matching frames so that
  they reach the entry.

The flows of a port are dropped when its interface is unregistered;
their traffic returns to the software path and the flowtable offers
them again once their hardware statistics stop.

Assisted-by: LLM
Signed-off-by: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
---
 drivers/net/ethernet/zte/zx279128s-eth.h  |  1 +
 drivers/net/ethernet/zte/zx279128s-ppe.c  | 92 ++++++++++++++++++-----
 drivers/net/ethernet/zte/zx279128s-wlan.c |  9 ++-
 3 files changed, 82 insertions(+), 20 deletions(-)

diff --git a/drivers/net/ethernet/zte/zx279128s-eth.h b/drivers/net/ethernet/zte/zx279128s-eth.h
index b5a547eade35..a5c8df1c60c3 100644
--- a/drivers/net/ethernet/zte/zx279128s-eth.h
+++ b/drivers/net/ethernet/zte/zx279128s-eth.h
@@ -480,6 +480,7 @@ void zx_set_trap_dmac(struct zx_eth_adapter *adapter, int idx, const u8 *mac);
 extern const struct rhashtable_params zx_ppe_ht_params;
 void zx_update_traps(struct zx_eth_adapter *adapter);
 void zx_update_mac_tables(struct zx_eth_adapter *adapter);
+void zx_ppe_wlan_flush(struct zx_eth_adapter *adapter, int wlan_port);
 int zx_eth_setup_tc(struct net_device *dev, enum tc_setup_type type,
 		    void *type_data);
 
diff --git a/drivers/net/ethernet/zte/zx279128s-ppe.c b/drivers/net/ethernet/zte/zx279128s-ppe.c
index ff19d2cc67bd..e02d6bfbddd9 100644
--- a/drivers/net/ethernet/zte/zx279128s-ppe.c
+++ b/drivers/net/ethernet/zte/zx279128s-ppe.c
@@ -37,6 +37,8 @@ struct zx_ppe_entry {
 	u16			flow;
 	u16			nh;
 	u8			subnet;
+	s8			wlan_in;	/* WLAN port of the ingress, or -1 */
+	s8			wlan_out;	/* WLAN port of the egress, or -1 */
 };
 
 const struct rhashtable_params zx_ppe_ht_params = {
@@ -168,12 +170,13 @@ static void zx_ppe_slots(const struct zx_ppe_tuple *t, u16 slot[2])
 }
 
 /*
- * Classifier entry: rewrite index, egress port and forward flag, then the
- * key. Words 1-3 are the same constants in every entry of the stock
- * firmware, and so is the 0x44 in word 0.
+ * Classifier entry: rewrite index, egress port (a bridge port or a WLAN
+ * logical port) and forward flag, then the key. Words 1-3 are the same
+ * constants in every entry of the stock firmware, and so is the 0x44 in
+ * word 0.
  */
-static void zx_ppe_hash_entry(const struct zx_ppe_tuple *t, u16 flow, int port,
-			      u32 w[9])
+static void zx_ppe_hash_entry(const struct zx_ppe_tuple *t, u16 flow,
+			      int egress, u32 w[9])
 {
 	u8 key[20] = {};
 	u16 hw[7];
@@ -185,7 +188,7 @@ static void zx_ppe_hash_entry(const struct zx_ppe_tuple *t, u16 flow, int port,
 	for (i = 0; i < 7; i++)
 		zx_ppe_put_bits(key, 24 + 16 * i, 16, hw[i]);
 	w[0] = FIELD_PREP(ZX_CLA_W0_FLOW, flow) | ZX_CLA_W0_FWD |
-	       FIELD_PREP(ZX_CLA_W0_EGRESS, ZX_BRPORT(port)) | ZX_CLA_W0_BITS;
+	       FIELD_PREP(ZX_CLA_W0_EGRESS, egress) | ZX_CLA_W0_BITS;
 	w[1] = 0xfa11c000;
 	w[2] = 0x00000608;
 	w[3] = 0x80000000;
@@ -305,22 +308,17 @@ static int zx_ppe_flow_add(struct zx_eth_adapter *adapter,
 	__be32 new_saddr, new_daddr;
 	u16 slot[2];
 	u32 w[17];
-	int i, ret, port, subnet, flow, nh;
+	int i, ret, egress, subnet, flow, nh, ingress_ifindex = 0;
+	int wlan_in = -1, wlan_out = -1;
 
 	if (rhashtable_lookup_fast(&adapter->ppe_flows, &f->cookie, zx_ppe_ht_params))
 		return -EEXIST;
 
-	/* the hardware only sees frames from our switch ports */
 	if (flow_rule_match_key(rule, FLOW_DISSECTOR_KEY_META)) {
 		struct flow_match_meta match;
 
 		flow_rule_match_meta(rule, &match);
-		for (i = 0; i < ZX_NUM_PORTS; i++)
-			if (adapter->ports[i] &&
-			    adapter->ports[i]->ifindex == match.key->ingress_ifindex)
-				break;
-		if (i == ZX_NUM_PORTS)
-			return -EOPNOTSUPP;
+		ingress_ifindex = match.key->ingress_ifindex;
 	}
 
 	if (flow_rule_match_key(rule, FLOW_DISSECTOR_KEY_CONTROL)) {
@@ -363,6 +361,23 @@ static int zx_ppe_flow_add(struct zx_eth_adapter *adapter,
 	rw.new_sport = t.sport;
 	rw.new_dport = t.dport;
 
+	/*
+	 * The hardware sees frames from our switch ports, and those a WLAN
+	 * port's ingress hook injects for it (zx279128s-wlan.c).
+	 */
+	if (ingress_ifindex) {
+		for (i = 0; i < ZX_NUM_PORTS; i++)
+			if (adapter->ports[i] &&
+			    adapter->ports[i]->ifindex == ingress_ifindex)
+				break;
+		if (i == ZX_NUM_PORTS) {
+			wlan_in = zx_wlan_port_of_ingress(adapter, ingress_ifindex,
+							  t.saddr);
+			if (wlan_in < 0)
+				return -EOPNOTSUPP;
+		}
+	}
+
 	flow_action_for_each(i, act, &rule->action) {
 		switch (act->id) {
 		case FLOW_ACTION_MANGLE:
@@ -410,11 +425,19 @@ static int zx_ppe_flow_add(struct zx_eth_adapter *adapter,
 		}
 	}
 
-	if (!odev || !zx_eth_is_port(odev))
+	if (!odev)
 		return -EOPNOTSUPP;
-	port = ((struct zx_eth_priv *)netdev_priv(odev))->port;
 	if (!is_valid_ether_addr(eth.h_source) || !is_valid_ether_addr(eth.h_dest))
 		return -EOPNOTSUPP;
+	if (zx_eth_is_port(odev)) {
+		egress = ZX_BRPORT(((struct zx_eth_priv *)netdev_priv(odev))->port);
+	} else {
+		/* an AP interface, or the bridge in front of it */
+		wlan_out = zx_wlan_port_of_egress(adapter, odev, eth.h_dest);
+		if (wlan_out < 0)
+			return -EOPNOTSUPP;
+		egress = ZX_WLAN_PORT(wlan_out);
+	}
 
 	rw.sip = new_saddr != t.saddr;
 	rw.dip = new_daddr != t.daddr;
@@ -462,7 +485,7 @@ static int zx_ppe_flow_add(struct zx_eth_adapter *adapter,
 	ret = zx_pp_write(adapter, ZX_CLA_BASE, ZX_CLA_AGING, slot[1], w, 0);
 	if (ret)
 		goto err_nh;
-	zx_ppe_hash_entry(&t, flow, port, w);
+	zx_ppe_hash_entry(&t, flow, egress, w);
 	ret = zx_pp_write(adapter, ZX_CLA_BASE,
 			  slot[1] < ZX_PPE_HASH0_SIZE ? ZX_CLA_HASH0 : ZX_CLA_HASH1,
 			  slot[1] % ZX_PPE_HASH0_SIZE, w, 9);
@@ -474,11 +497,18 @@ static int zx_ppe_flow_add(struct zx_eth_adapter *adapter,
 	e->flow = flow;
 	e->nh = nh;
 	e->subnet = subnet;
+	e->wlan_in = wlan_in;
+	e->wlan_out = wlan_out;
 	ret = rhashtable_insert_fast(&adapter->ppe_flows, &e->node, zx_ppe_ht_params);
 	if (ret)
 		goto err_entry;
 	set_bit(e->hash, adapter->ppe_hash_used);
 	adapter->ppe_count++;
+	/* the frames of a WLAN ingress flow only reach the entry if injected */
+	if (wlan_in >= 0)
+		zx_wlan_flow_set(adapter, flow,
+				 zx_wlan_flow_key(t.proto, t.saddr, t.daddr,
+						  t.sport, t.dport), wlan_in);
 	return 0;
 
 err_entry:
@@ -499,6 +529,8 @@ static int zx_ppe_flow_add(struct zx_eth_adapter *adapter,
 static void zx_ppe_entry_remove(struct zx_eth_adapter *adapter,
 				struct zx_ppe_entry *e)
 {
+	if (e->wlan_in >= 0)
+		zx_wlan_flow_set(adapter, e->flow, 0, 0);
 	zx_pp_write(adapter, ZX_CLA_BASE,
 		    e->hash < ZX_PPE_HASH0_SIZE ? ZX_CLA_HASH0 : ZX_CLA_HASH1,
 		    e->hash % ZX_PPE_HASH0_SIZE, NULL, 0);
@@ -524,6 +556,32 @@ static int zx_ppe_flow_del(struct zx_eth_adapter *adapter,
 	return 0;
 }
 
+/*
+ * Drop the flows of a WLAN port whose interface goes away; their traffic
+ * returns to the software path, and the flowtable offers them again once
+ * their statistics stop.  Called with ppe_lock held.
+ */
+void zx_ppe_wlan_flush(struct zx_eth_adapter *adapter, int wlan_port)
+{
+	struct rhashtable_iter iter;
+	struct zx_ppe_entry *e;
+
+	rhashtable_walk_enter(&adapter->ppe_flows, &iter);
+	rhashtable_walk_start(&iter);
+	while ((e = rhashtable_walk_next(&iter))) {
+		if (IS_ERR(e))
+			continue;
+		if (e->wlan_in != wlan_port && e->wlan_out != wlan_port)
+			continue;
+		rhashtable_remove_fast(&adapter->ppe_flows, &e->node,
+				       zx_ppe_ht_params);
+		zx_ppe_entry_remove(adapter, e);
+		kfree(e);
+	}
+	rhashtable_walk_stop(&iter);
+	rhashtable_walk_exit(&iter);
+}
+
 /* No packet counters: report use from the entry's hit flag */
 static int zx_ppe_flow_stats(struct zx_eth_adapter *adapter,
 			     struct flow_cls_offload *f)
diff --git a/drivers/net/ethernet/zte/zx279128s-wlan.c b/drivers/net/ethernet/zte/zx279128s-wlan.c
index 17ba32bd993a..6c6f6a36d34f 100644
--- a/drivers/net/ethernet/zte/zx279128s-wlan.c
+++ b/drivers/net/ethernet/zte/zx279128s-wlan.c
@@ -707,9 +707,12 @@ static int zx_wlan_netdev_event(struct notifier_block *nb, unsigned long event,
 	if (event != NETDEV_UNREGISTER || !zx_wlan_is_ap(dev))
 		return NOTIFY_DONE;
 	mutex_lock(&w->adapter->ppe_lock);
-	for (i = 0; i < ZX_WLAN_PORTS; i++)
-		if (w->ports[i].vif == dev)
-			zx_wlan_port_put(w, i);
+	for (i = 0; i < ZX_WLAN_PORTS; i++) {
+		if (w->ports[i].vif != dev)
+			continue;
+		zx_ppe_wlan_flush(w->adapter, i);
+		zx_wlan_port_put(w, i);
+	}
 	mutex_unlock(&w->adapter->ppe_lock);
 	return NOTIFY_DONE;
 }
-- 
2.30.2

